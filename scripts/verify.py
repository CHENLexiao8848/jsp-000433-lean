"""Verify published input hashes and run the named recursive Lean axiom audit."""
from pathlib import Path
import hashlib,json,re,subprocess
root=Path(__file__).resolve().parents[1]
expected=json.loads((root/'evidence/SOURCE-SHA256.json').read_text(encoding='utf-8'))
actual_sources={p.relative_to(root).as_posix() for p in (root/'LeanProblems').glob('*.lean')}
assert actual_sources=={p for p in expected if p.startswith('LeanProblems/')},'Source closure mismatch'
for name,digest in expected.items():
    assert hashlib.sha256((root/name).read_bytes()).hexdigest()==digest,name
for name in actual_sources:
    assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',(root/name).read_text(encoding='utf-8')),name
run=subprocess.run(['lake','env','lean','-j1','Audit.lean'],cwd=root,capture_output=True,text=True,encoding='utf-8')
print(run.stdout,end=''); print(run.stderr,end='')
assert run.returncode==0,run.returncode
assert not re.search(r'\b(?:warning|error):',run.stdout+run.stderr)
names=re.findall(r'^#print axioms (\S+)',(root/'Audit.lean').read_text(encoding='utf-8'),re.M)
found=re.findall(r"'([^']+)' depends on axioms:\s*\[([^\]]*)\]",run.stdout)
assert len(found)==len(names) and {n for n,_ in found}==set(names),'Incomplete audit'
for name,axioms in found:
    assert {a.strip() for a in axioms.split(',') if a.strip()} <= {'propext','Classical.choice','Quot.sound'},(name,axioms)
print(f'PASS: {len(expected)} input hashes, {len(actual_sources)} proof modules, {len(found)} recursive axiom reports')
