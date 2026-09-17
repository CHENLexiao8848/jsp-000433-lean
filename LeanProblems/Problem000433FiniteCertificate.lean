import LeanProblems.Problem000433Coefficients
import LeanProblems.Problem000433Finite

namespace JSP.Problem000433

/-- Finite part of the arithmetic certificate, evaluated by the Lean kernel. -/
abbrev CertificateAt (q : ℕ) : Prop :=
  1 ≤ harmonicCertificate coefficient q ∧
    (q ∉ certificateExceptions → harmonicCertificate coefficient q < 31 / 30)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

private theorem certificate_1 : CertificateAt 1 := by decide +kernel

private theorem certificate_2 : CertificateAt 2 := by decide +kernel

private theorem certificate_3 : CertificateAt 3 := by decide +kernel

private theorem certificate_4 : CertificateAt 4 := by decide +kernel

private theorem certificate_5 : CertificateAt 5 := by decide +kernel

private theorem certificate_6 : CertificateAt 6 := by decide +kernel

private theorem certificate_7 : CertificateAt 7 := by decide +kernel

private theorem certificate_8 : CertificateAt 8 := by decide +kernel

private theorem certificate_9 : CertificateAt 9 := by decide +kernel

private theorem certificate_10 : CertificateAt 10 := by decide +kernel

private theorem certificate_11 : CertificateAt 11 := by decide +kernel

private theorem certificate_12 : CertificateAt 12 := by decide +kernel

private theorem certificate_13 : CertificateAt 13 := by decide +kernel

private theorem certificate_14 : CertificateAt 14 := by decide +kernel

private theorem certificate_15 : CertificateAt 15 := by decide +kernel

private theorem certificate_16 : CertificateAt 16 := by decide +kernel

private theorem certificate_17 : CertificateAt 17 := by decide +kernel

private theorem certificate_18 : CertificateAt 18 := by decide +kernel

private theorem certificate_19 : CertificateAt 19 := by decide +kernel

private theorem certificate_20 : CertificateAt 20 := by decide +kernel

private theorem certificate_21 : CertificateAt 21 := by decide +kernel

private theorem certificate_22 : CertificateAt 22 := by decide +kernel

private theorem certificate_23 : CertificateAt 23 := by decide +kernel

private theorem certificate_24 : CertificateAt 24 := by decide +kernel

private theorem certificate_25 : CertificateAt 25 := by decide +kernel

private theorem certificate_26 : CertificateAt 26 := by decide +kernel

private theorem certificate_27 : CertificateAt 27 := by decide +kernel

private theorem certificate_28 : CertificateAt 28 := by decide +kernel

private theorem certificate_29 : CertificateAt 29 := by decide +kernel

private theorem certificate_30 : CertificateAt 30 := by decide +kernel

private theorem certificate_31 : CertificateAt 31 := by decide +kernel

private theorem certificate_32 : CertificateAt 32 := by decide +kernel

private theorem certificate_33 : CertificateAt 33 := by decide +kernel

private theorem certificate_34 : CertificateAt 34 := by decide +kernel

private theorem certificate_35 : CertificateAt 35 := by decide +kernel

private theorem certificate_36 : CertificateAt 36 := by decide +kernel

private theorem certificate_37 : CertificateAt 37 := by decide +kernel

private theorem certificate_38 : CertificateAt 38 := by decide +kernel

private theorem certificate_39 : CertificateAt 39 := by decide +kernel

private theorem certificate_40 : CertificateAt 40 := by decide +kernel

private theorem certificate_41 : CertificateAt 41 := by decide +kernel

private theorem certificate_42 : CertificateAt 42 := by decide +kernel

private theorem certificate_43 : CertificateAt 43 := by decide +kernel

private theorem certificate_44 : CertificateAt 44 := by decide +kernel

private theorem certificate_45 : CertificateAt 45 := by decide +kernel

private theorem certificate_46 : CertificateAt 46 := by decide +kernel

private theorem certificate_47 : CertificateAt 47 := by decide +kernel

private theorem certificate_48 : CertificateAt 48 := by decide +kernel

private theorem certificate_49 : CertificateAt 49 := by decide +kernel

private theorem certificate_50 : CertificateAt 50 := by decide +kernel

private theorem certificate_51 : CertificateAt 51 := by decide +kernel

private theorem certificate_52 : CertificateAt 52 := by decide +kernel

private theorem certificate_53 : CertificateAt 53 := by decide +kernel

private theorem certificate_54 : CertificateAt 54 := by decide +kernel

private theorem certificate_55 : CertificateAt 55 := by decide +kernel

private theorem certificate_56 : CertificateAt 56 := by decide +kernel

private theorem certificate_57 : CertificateAt 57 := by decide +kernel

private theorem certificate_58 : CertificateAt 58 := by decide +kernel

private theorem certificate_59 : CertificateAt 59 := by decide +kernel

private theorem certificate_60 : CertificateAt 60 := by decide +kernel

private theorem certificate_61 : CertificateAt 61 := by decide +kernel

private theorem certificate_62 : CertificateAt 62 := by decide +kernel

private theorem certificate_63 : CertificateAt 63 := by decide +kernel

private theorem certificate_64 : CertificateAt 64 := by decide +kernel

private theorem certificate_65 : CertificateAt 65 := by decide +kernel

private theorem certificate_66 : CertificateAt 66 := by decide +kernel

private theorem certificate_67 : CertificateAt 67 := by decide +kernel

private theorem certificate_68 : CertificateAt 68 := by decide +kernel

private theorem certificate_69 : CertificateAt 69 := by decide +kernel

private theorem certificate_70 : CertificateAt 70 := by decide +kernel

private theorem certificate_71 : CertificateAt 71 := by decide +kernel

private theorem certificate_72 : CertificateAt 72 := by decide +kernel

private theorem certificate_73 : CertificateAt 73 := by decide +kernel

private theorem certificate_74 : CertificateAt 74 := by decide +kernel

private theorem certificate_75 : CertificateAt 75 := by decide +kernel

private theorem certificate_76 : CertificateAt 76 := by decide +kernel

private theorem certificate_77 : CertificateAt 77 := by decide +kernel

private theorem certificate_78 : CertificateAt 78 := by decide +kernel

private theorem certificate_79 : CertificateAt 79 := by decide +kernel

private theorem certificate_80 : CertificateAt 80 := by decide +kernel

private theorem certificate_81 : CertificateAt 81 := by decide +kernel

private theorem certificate_82 : CertificateAt 82 := by decide +kernel

private theorem certificate_83 : CertificateAt 83 := by decide +kernel

private theorem certificate_84 : CertificateAt 84 := by decide +kernel

private theorem certificate_85 : CertificateAt 85 := by decide +kernel

private theorem certificate_86 : CertificateAt 86 := by decide +kernel

private theorem certificate_87 : CertificateAt 87 := by decide +kernel

private theorem certificate_88 : CertificateAt 88 := by decide +kernel

private theorem certificate_89 : CertificateAt 89 := by decide +kernel

private theorem certificate_90 : CertificateAt 90 := by decide +kernel

private theorem certificate_91 : CertificateAt 91 := by decide +kernel

private theorem certificate_92 : CertificateAt 92 := by decide +kernel

private theorem certificate_93 : CertificateAt 93 := by decide +kernel

private theorem certificate_94 : CertificateAt 94 := by decide +kernel

private theorem certificate_95 : CertificateAt 95 := by decide +kernel

private theorem certificate_96 : CertificateAt 96 := by decide +kernel

private theorem certificate_97 : CertificateAt 97 := by decide +kernel

private theorem certificate_98 : CertificateAt 98 := by decide +kernel

private theorem certificate_99 : CertificateAt 99 := by decide +kernel

private theorem certificate_100 : CertificateAt 100 := by decide +kernel

private theorem certificate_101 : CertificateAt 101 := by decide +kernel

private theorem certificate_102 : CertificateAt 102 := by decide +kernel

private theorem certificate_103 : CertificateAt 103 := by decide +kernel

private theorem certificate_104 : CertificateAt 104 := by decide +kernel

private theorem certificate_105 : CertificateAt 105 := by decide +kernel

private theorem certificate_106 : CertificateAt 106 := by decide +kernel

private theorem certificate_107 : CertificateAt 107 := by decide +kernel

private theorem certificate_108 : CertificateAt 108 := by decide +kernel

private theorem certificate_109 : CertificateAt 109 := by decide +kernel

private theorem certificate_110 : CertificateAt 110 := by decide +kernel

private theorem certificate_111 : CertificateAt 111 := by decide +kernel

private theorem certificate_112 : CertificateAt 112 := by decide +kernel

private theorem certificate_113 : CertificateAt 113 := by decide +kernel

private theorem certificate_114 : CertificateAt 114 := by decide +kernel

private theorem certificate_115 : CertificateAt 115 := by decide +kernel

private theorem certificate_116 : CertificateAt 116 := by decide +kernel

private theorem certificate_117 : CertificateAt 117 := by decide +kernel

private theorem certificate_118 : CertificateAt 118 := by decide +kernel

private theorem certificate_119 : CertificateAt 119 := by decide +kernel

private theorem certificate_120 : CertificateAt 120 := by decide +kernel

private theorem certificate_121 : CertificateAt 121 := by decide +kernel

private theorem certificate_122 : CertificateAt 122 := by decide +kernel

private theorem certificate_123 : CertificateAt 123 := by decide +kernel

private theorem certificate_124 : CertificateAt 124 := by decide +kernel

private theorem certificate_125 : CertificateAt 125 := by decide +kernel

private theorem certificate_126 : CertificateAt 126 := by decide +kernel

private theorem certificate_127 : CertificateAt 127 := by decide +kernel

private theorem certificate_128 : CertificateAt 128 := by decide +kernel

private theorem certificate_129 : CertificateAt 129 := by decide +kernel

private theorem certificate_130 : CertificateAt 130 := by decide +kernel

private theorem certificate_131 : CertificateAt 131 := by decide +kernel

private theorem certificate_132 : CertificateAt 132 := by decide +kernel

private theorem certificate_133 : CertificateAt 133 := by decide +kernel

private theorem certificate_134 : CertificateAt 134 := by decide +kernel

private theorem certificate_135 : CertificateAt 135 := by decide +kernel

private theorem certificate_136 : CertificateAt 136 := by decide +kernel

private theorem certificate_137 : CertificateAt 137 := by decide +kernel

private theorem certificate_138 : CertificateAt 138 := by decide +kernel

private theorem certificate_139 : CertificateAt 139 := by decide +kernel

private theorem certificate_140 : CertificateAt 140 := by decide +kernel

private theorem certificate_141 : CertificateAt 141 := by decide +kernel

private theorem certificate_142 : CertificateAt 142 := by decide +kernel

private theorem certificate_143 : CertificateAt 143 := by decide +kernel

private theorem certificate_144 : CertificateAt 144 := by decide +kernel

private theorem certificate_145 : CertificateAt 145 := by decide +kernel

private theorem certificate_146 : CertificateAt 146 := by decide +kernel

private theorem certificate_147 : CertificateAt 147 := by decide +kernel

private theorem certificate_148 : CertificateAt 148 := by decide +kernel

private theorem certificate_149 : CertificateAt 149 := by decide +kernel

private theorem certificate_150 : CertificateAt 150 := by decide +kernel

private theorem certificate_151 : CertificateAt 151 := by decide +kernel

private theorem certificate_152 : CertificateAt 152 := by decide +kernel

private theorem certificate_153 : CertificateAt 153 := by decide +kernel

private theorem certificate_154 : CertificateAt 154 := by decide +kernel

private theorem certificate_155 : CertificateAt 155 := by decide +kernel

private theorem certificate_156 : CertificateAt 156 := by decide +kernel

private theorem certificate_157 : CertificateAt 157 := by decide +kernel

private theorem certificate_158 : CertificateAt 158 := by decide +kernel

private theorem certificate_159 : CertificateAt 159 := by decide +kernel

private theorem certificate_160 : CertificateAt 160 := by decide +kernel

private theorem certificate_161 : CertificateAt 161 := by decide +kernel

private theorem certificate_162 : CertificateAt 162 := by decide +kernel

private theorem certificate_163 : CertificateAt 163 := by decide +kernel

private theorem certificate_164 : CertificateAt 164 := by decide +kernel

private theorem certificate_165 : CertificateAt 165 := by decide +kernel

private theorem certificate_166 : CertificateAt 166 := by decide +kernel

private theorem certificate_167 : CertificateAt 167 := by decide +kernel

private theorem certificate_168 : CertificateAt 168 := by decide +kernel

private theorem certificate_169 : CertificateAt 169 := by decide +kernel

private theorem certificate_170 : CertificateAt 170 := by decide +kernel

private theorem certificate_171 : CertificateAt 171 := by decide +kernel

private theorem certificate_172 : CertificateAt 172 := by decide +kernel

private theorem certificate_173 : CertificateAt 173 := by decide +kernel

private theorem certificate_174 : CertificateAt 174 := by decide +kernel

private theorem certificate_175 : CertificateAt 175 := by decide +kernel

private theorem certificate_176 : CertificateAt 176 := by decide +kernel

private theorem certificate_177 : CertificateAt 177 := by decide +kernel

private theorem certificate_178 : CertificateAt 178 := by decide +kernel

private theorem certificate_179 : CertificateAt 179 := by decide +kernel

private theorem certificate_180 : CertificateAt 180 := by decide +kernel

private theorem certificate_181 : CertificateAt 181 := by decide +kernel

private theorem certificate_182 : CertificateAt 182 := by decide +kernel

private theorem certificate_183 : CertificateAt 183 := by decide +kernel

private theorem certificate_184 : CertificateAt 184 := by decide +kernel

private theorem certificate_185 : CertificateAt 185 := by decide +kernel

private theorem certificate_186 : CertificateAt 186 := by decide +kernel

private theorem certificate_187 : CertificateAt 187 := by decide +kernel

private theorem certificate_188 : CertificateAt 188 := by decide +kernel

private theorem certificate_189 : CertificateAt 189 := by decide +kernel

private theorem certificate_190 : CertificateAt 190 := by decide +kernel

private theorem certificate_191 : CertificateAt 191 := by decide +kernel

private theorem certificate_192 : CertificateAt 192 := by decide +kernel

private theorem certificate_193 : CertificateAt 193 := by decide +kernel

private theorem certificate_194 : CertificateAt 194 := by decide +kernel

private theorem certificate_195 : CertificateAt 195 := by decide +kernel

private theorem certificate_196 : CertificateAt 196 := by decide +kernel

private theorem certificate_197 : CertificateAt 197 := by decide +kernel

private theorem certificate_198 : CertificateAt 198 := by decide +kernel

private theorem certificate_199 : CertificateAt 199 := by decide +kernel

private theorem certificate_200 : CertificateAt 200 := by decide +kernel

private theorem certificate_201 : CertificateAt 201 := by decide +kernel

private theorem certificate_202 : CertificateAt 202 := by decide +kernel

private theorem certificate_203 : CertificateAt 203 := by decide +kernel

private theorem certificate_204 : CertificateAt 204 := by decide +kernel

private theorem certificate_205 : CertificateAt 205 := by decide +kernel

private theorem certificate_206 : CertificateAt 206 := by decide +kernel

private theorem certificate_207 : CertificateAt 207 := by decide +kernel

private theorem certificate_208 : CertificateAt 208 := by decide +kernel

private theorem certificate_209 : CertificateAt 209 := by decide +kernel

private theorem certificate_210 : CertificateAt 210 := by decide +kernel

private theorem certificate_211 : CertificateAt 211 := by decide +kernel

private theorem certificate_212 : CertificateAt 212 := by decide +kernel

private theorem certificate_213 : CertificateAt 213 := by decide +kernel

private theorem certificate_214 : CertificateAt 214 := by decide +kernel

private theorem certificate_215 : CertificateAt 215 := by decide +kernel

private theorem certificate_216 : CertificateAt 216 := by decide +kernel

private theorem certificate_217 : CertificateAt 217 := by decide +kernel

private theorem certificate_218 : CertificateAt 218 := by decide +kernel

private theorem certificate_219 : CertificateAt 219 := by decide +kernel

private theorem certificate_220 : CertificateAt 220 := by decide +kernel

private theorem certificate_221 : CertificateAt 221 := by decide +kernel

private theorem certificate_222 : CertificateAt 222 := by decide +kernel

private theorem certificate_223 : CertificateAt 223 := by decide +kernel

private theorem certificate_224 : CertificateAt 224 := by decide +kernel

private theorem certificate_225 : CertificateAt 225 := by decide +kernel

private theorem certificate_226 : CertificateAt 226 := by decide +kernel

private theorem certificate_227 : CertificateAt 227 := by decide +kernel

private theorem certificate_228 : CertificateAt 228 := by decide +kernel

private theorem certificate_229 : CertificateAt 229 := by decide +kernel

private theorem certificate_230 : CertificateAt 230 := by decide +kernel

private theorem certificate_231 : CertificateAt 231 := by decide +kernel

private theorem certificate_232 : CertificateAt 232 := by decide +kernel

private theorem certificate_233 : CertificateAt 233 := by decide +kernel

private theorem certificate_234 : CertificateAt 234 := by decide +kernel

private theorem certificate_235 : CertificateAt 235 := by decide +kernel

private theorem certificate_236 : CertificateAt 236 := by decide +kernel

private theorem certificate_237 : CertificateAt 237 := by decide +kernel

private theorem certificate_238 : CertificateAt 238 := by decide +kernel

private theorem certificate_239 : CertificateAt 239 := by decide +kernel

private theorem certificate_240 : CertificateAt 240 := by decide +kernel

private theorem certificate_241 : CertificateAt 241 := by decide +kernel

private theorem certificate_242 : CertificateAt 242 := by decide +kernel

private theorem certificate_243 : CertificateAt 243 := by decide +kernel

private theorem certificate_244 : CertificateAt 244 := by decide +kernel

private theorem certificate_245 : CertificateAt 245 := by decide +kernel

private theorem certificate_246 : CertificateAt 246 := by decide +kernel

private theorem certificate_247 : CertificateAt 247 := by decide +kernel

private theorem certificate_248 : CertificateAt 248 := by decide +kernel

private theorem certificate_249 : CertificateAt 249 := by decide +kernel

private theorem certificate_250 : CertificateAt 250 := by decide +kernel

private theorem certificate_251 : CertificateAt 251 := by decide +kernel

private theorem certificate_252 : CertificateAt 252 := by decide +kernel

private theorem certificate_253 : CertificateAt 253 := by decide +kernel

private theorem certificate_254 : CertificateAt 254 := by decide +kernel

private theorem certificate_255 : CertificateAt 255 := by decide +kernel

private theorem certificate_256 : CertificateAt 256 := by decide +kernel

private theorem certificate_257 : CertificateAt 257 := by decide +kernel

private theorem certificate_258 : CertificateAt 258 := by decide +kernel

private theorem certificate_259 : CertificateAt 259 := by decide +kernel

private theorem certificate_260 : CertificateAt 260 := by decide +kernel

private theorem certificate_261 : CertificateAt 261 := by decide +kernel

private theorem certificate_262 : CertificateAt 262 := by decide +kernel

private theorem certificate_263 : CertificateAt 263 := by decide +kernel

private theorem certificate_264 : CertificateAt 264 := by decide +kernel

private theorem certificate_265 : CertificateAt 265 := by decide +kernel

private theorem certificate_266 : CertificateAt 266 := by decide +kernel

private theorem certificate_267 : CertificateAt 267 := by decide +kernel

private theorem certificate_268 : CertificateAt 268 := by decide +kernel

private theorem certificate_269 : CertificateAt 269 := by decide +kernel

private theorem certificate_270 : CertificateAt 270 := by decide +kernel

private theorem certificate_271 : CertificateAt 271 := by decide +kernel

private theorem certificate_272 : CertificateAt 272 := by decide +kernel

private theorem certificate_273 : CertificateAt 273 := by decide +kernel

private theorem certificate_274 : CertificateAt 274 := by decide +kernel

private theorem certificate_275 : CertificateAt 275 := by decide +kernel

private theorem certificate_276 : CertificateAt 276 := by decide +kernel

private theorem certificate_277 : CertificateAt 277 := by decide +kernel

private theorem certificate_278 : CertificateAt 278 := by decide +kernel

private theorem certificate_279 : CertificateAt 279 := by decide +kernel

private theorem certificate_280 : CertificateAt 280 := by decide +kernel

private theorem certificate_281 : CertificateAt 281 := by decide +kernel

private theorem certificate_282 : CertificateAt 282 := by decide +kernel

private theorem certificate_283 : CertificateAt 283 := by decide +kernel

private theorem certificate_284 : CertificateAt 284 := by decide +kernel

private theorem certificate_285 : CertificateAt 285 := by decide +kernel

private theorem certificate_286 : CertificateAt 286 := by decide +kernel

private theorem certificate_287 : CertificateAt 287 := by decide +kernel

private theorem certificate_288 : CertificateAt 288 := by decide +kernel

private theorem certificate_289 : CertificateAt 289 := by decide +kernel

private theorem certificate_290 : CertificateAt 290 := by decide +kernel

private theorem certificate_291 : CertificateAt 291 := by decide +kernel

private theorem certificate_292 : CertificateAt 292 := by decide +kernel

private theorem certificate_293 : CertificateAt 293 := by decide +kernel

private theorem certificate_294 : CertificateAt 294 := by decide +kernel

private theorem certificate_295 : CertificateAt 295 := by decide +kernel

private theorem certificate_296 : CertificateAt 296 := by decide +kernel

private theorem certificate_297 : CertificateAt 297 := by decide +kernel

private theorem certificate_298 : CertificateAt 298 := by decide +kernel

private theorem certificate_299 : CertificateAt 299 := by decide +kernel

private theorem certificate_300 : CertificateAt 300 := by decide +kernel

private theorem certificate_301 : CertificateAt 301 := by decide +kernel

private theorem certificate_302 : CertificateAt 302 := by decide +kernel

private theorem certificate_303 : CertificateAt 303 := by decide +kernel

private theorem certificate_304 : CertificateAt 304 := by decide +kernel

private theorem certificate_305 : CertificateAt 305 := by decide +kernel

private theorem certificate_306 : CertificateAt 306 := by decide +kernel

private theorem certificate_307 : CertificateAt 307 := by decide +kernel

private theorem certificate_308 : CertificateAt 308 := by decide +kernel

private theorem certificate_309 : CertificateAt 309 := by decide +kernel

private theorem certificate_310 : CertificateAt 310 := by decide +kernel

private theorem certificate_311 : CertificateAt 311 := by decide +kernel

private theorem certificate_312 : CertificateAt 312 := by decide +kernel

private theorem certificate_313 : CertificateAt 313 := by decide +kernel

private theorem certificate_314 : CertificateAt 314 := by decide +kernel

private theorem certificate_315 : CertificateAt 315 := by decide +kernel

private theorem certificate_316 : CertificateAt 316 := by decide +kernel

private theorem certificate_317 : CertificateAt 317 := by decide +kernel

private theorem certificate_318 : CertificateAt 318 := by decide +kernel

private theorem certificate_319 : CertificateAt 319 := by decide +kernel

private theorem certificate_320 : CertificateAt 320 := by decide +kernel

private theorem certificate_321 : CertificateAt 321 := by decide +kernel

private theorem certificate_322 : CertificateAt 322 := by decide +kernel

private theorem certificate_323 : CertificateAt 323 := by decide +kernel

private theorem certificate_324 : CertificateAt 324 := by decide +kernel

private theorem certificate_325 : CertificateAt 325 := by decide +kernel

private theorem certificate_326 : CertificateAt 326 := by decide +kernel

private theorem certificate_327 : CertificateAt 327 := by decide +kernel

private theorem certificate_328 : CertificateAt 328 := by decide +kernel

private theorem certificate_329 : CertificateAt 329 := by decide +kernel

private theorem certificate_330 : CertificateAt 330 := by decide +kernel

private theorem certificate_331 : CertificateAt 331 := by decide +kernel

private theorem certificate_332 : CertificateAt 332 := by decide +kernel

private theorem certificate_333 : CertificateAt 333 := by decide +kernel

private theorem certificate_334 : CertificateAt 334 := by decide +kernel

private theorem certificate_335 : CertificateAt 335 := by decide +kernel

private theorem certificate_336 : CertificateAt 336 := by decide +kernel

private theorem certificate_337 : CertificateAt 337 := by decide +kernel

private theorem certificate_338 : CertificateAt 338 := by decide +kernel

private theorem certificate_339 : CertificateAt 339 := by decide +kernel

private theorem certificate_340 : CertificateAt 340 := by decide +kernel

private theorem certificate_341 : CertificateAt 341 := by decide +kernel

private theorem certificate_342 : CertificateAt 342 := by decide +kernel

private theorem certificate_343 : CertificateAt 343 := by decide +kernel

private theorem certificate_344 : CertificateAt 344 := by decide +kernel

private theorem certificate_345 : CertificateAt 345 := by decide +kernel

private theorem certificate_346 : CertificateAt 346 := by decide +kernel

private theorem certificate_347 : CertificateAt 347 := by decide +kernel

private theorem certificate_348 : CertificateAt 348 := by decide +kernel

private theorem certificate_349 : CertificateAt 349 := by decide +kernel

private theorem certificate_350 : CertificateAt 350 := by decide +kernel

private theorem certificate_351 : CertificateAt 351 := by decide +kernel

private theorem certificate_352 : CertificateAt 352 := by decide +kernel

private theorem certificate_353 : CertificateAt 353 := by decide +kernel

private theorem certificate_354 : CertificateAt 354 := by decide +kernel

private theorem certificate_355 : CertificateAt 355 := by decide +kernel

private theorem certificate_356 : CertificateAt 356 := by decide +kernel

private theorem certificate_357 : CertificateAt 357 := by decide +kernel

private theorem certificate_358 : CertificateAt 358 := by decide +kernel

private theorem certificate_359 : CertificateAt 359 := by decide +kernel

private theorem certificate_360 : CertificateAt 360 := by decide +kernel

private theorem certificate_361 : CertificateAt 361 := by decide +kernel

private theorem certificate_362 : CertificateAt 362 := by decide +kernel

private theorem certificate_363 : CertificateAt 363 := by decide +kernel

private theorem certificate_364 : CertificateAt 364 := by decide +kernel

private theorem certificate_365 : CertificateAt 365 := by decide +kernel

theorem certificate_through_365 (q : ℕ) (hpos : 0 < q) (hle : q ≤ 365) :
    CertificateAt q := by
  interval_cases q
  · exact certificate_1
  · exact certificate_2
  · exact certificate_3
  · exact certificate_4
  · exact certificate_5
  · exact certificate_6
  · exact certificate_7
  · exact certificate_8
  · exact certificate_9
  · exact certificate_10
  · exact certificate_11
  · exact certificate_12
  · exact certificate_13
  · exact certificate_14
  · exact certificate_15
  · exact certificate_16
  · exact certificate_17
  · exact certificate_18
  · exact certificate_19
  · exact certificate_20
  · exact certificate_21
  · exact certificate_22
  · exact certificate_23
  · exact certificate_24
  · exact certificate_25
  · exact certificate_26
  · exact certificate_27
  · exact certificate_28
  · exact certificate_29
  · exact certificate_30
  · exact certificate_31
  · exact certificate_32
  · exact certificate_33
  · exact certificate_34
  · exact certificate_35
  · exact certificate_36
  · exact certificate_37
  · exact certificate_38
  · exact certificate_39
  · exact certificate_40
  · exact certificate_41
  · exact certificate_42
  · exact certificate_43
  · exact certificate_44
  · exact certificate_45
  · exact certificate_46
  · exact certificate_47
  · exact certificate_48
  · exact certificate_49
  · exact certificate_50
  · exact certificate_51
  · exact certificate_52
  · exact certificate_53
  · exact certificate_54
  · exact certificate_55
  · exact certificate_56
  · exact certificate_57
  · exact certificate_58
  · exact certificate_59
  · exact certificate_60
  · exact certificate_61
  · exact certificate_62
  · exact certificate_63
  · exact certificate_64
  · exact certificate_65
  · exact certificate_66
  · exact certificate_67
  · exact certificate_68
  · exact certificate_69
  · exact certificate_70
  · exact certificate_71
  · exact certificate_72
  · exact certificate_73
  · exact certificate_74
  · exact certificate_75
  · exact certificate_76
  · exact certificate_77
  · exact certificate_78
  · exact certificate_79
  · exact certificate_80
  · exact certificate_81
  · exact certificate_82
  · exact certificate_83
  · exact certificate_84
  · exact certificate_85
  · exact certificate_86
  · exact certificate_87
  · exact certificate_88
  · exact certificate_89
  · exact certificate_90
  · exact certificate_91
  · exact certificate_92
  · exact certificate_93
  · exact certificate_94
  · exact certificate_95
  · exact certificate_96
  · exact certificate_97
  · exact certificate_98
  · exact certificate_99
  · exact certificate_100
  · exact certificate_101
  · exact certificate_102
  · exact certificate_103
  · exact certificate_104
  · exact certificate_105
  · exact certificate_106
  · exact certificate_107
  · exact certificate_108
  · exact certificate_109
  · exact certificate_110
  · exact certificate_111
  · exact certificate_112
  · exact certificate_113
  · exact certificate_114
  · exact certificate_115
  · exact certificate_116
  · exact certificate_117
  · exact certificate_118
  · exact certificate_119
  · exact certificate_120
  · exact certificate_121
  · exact certificate_122
  · exact certificate_123
  · exact certificate_124
  · exact certificate_125
  · exact certificate_126
  · exact certificate_127
  · exact certificate_128
  · exact certificate_129
  · exact certificate_130
  · exact certificate_131
  · exact certificate_132
  · exact certificate_133
  · exact certificate_134
  · exact certificate_135
  · exact certificate_136
  · exact certificate_137
  · exact certificate_138
  · exact certificate_139
  · exact certificate_140
  · exact certificate_141
  · exact certificate_142
  · exact certificate_143
  · exact certificate_144
  · exact certificate_145
  · exact certificate_146
  · exact certificate_147
  · exact certificate_148
  · exact certificate_149
  · exact certificate_150
  · exact certificate_151
  · exact certificate_152
  · exact certificate_153
  · exact certificate_154
  · exact certificate_155
  · exact certificate_156
  · exact certificate_157
  · exact certificate_158
  · exact certificate_159
  · exact certificate_160
  · exact certificate_161
  · exact certificate_162
  · exact certificate_163
  · exact certificate_164
  · exact certificate_165
  · exact certificate_166
  · exact certificate_167
  · exact certificate_168
  · exact certificate_169
  · exact certificate_170
  · exact certificate_171
  · exact certificate_172
  · exact certificate_173
  · exact certificate_174
  · exact certificate_175
  · exact certificate_176
  · exact certificate_177
  · exact certificate_178
  · exact certificate_179
  · exact certificate_180
  · exact certificate_181
  · exact certificate_182
  · exact certificate_183
  · exact certificate_184
  · exact certificate_185
  · exact certificate_186
  · exact certificate_187
  · exact certificate_188
  · exact certificate_189
  · exact certificate_190
  · exact certificate_191
  · exact certificate_192
  · exact certificate_193
  · exact certificate_194
  · exact certificate_195
  · exact certificate_196
  · exact certificate_197
  · exact certificate_198
  · exact certificate_199
  · exact certificate_200
  · exact certificate_201
  · exact certificate_202
  · exact certificate_203
  · exact certificate_204
  · exact certificate_205
  · exact certificate_206
  · exact certificate_207
  · exact certificate_208
  · exact certificate_209
  · exact certificate_210
  · exact certificate_211
  · exact certificate_212
  · exact certificate_213
  · exact certificate_214
  · exact certificate_215
  · exact certificate_216
  · exact certificate_217
  · exact certificate_218
  · exact certificate_219
  · exact certificate_220
  · exact certificate_221
  · exact certificate_222
  · exact certificate_223
  · exact certificate_224
  · exact certificate_225
  · exact certificate_226
  · exact certificate_227
  · exact certificate_228
  · exact certificate_229
  · exact certificate_230
  · exact certificate_231
  · exact certificate_232
  · exact certificate_233
  · exact certificate_234
  · exact certificate_235
  · exact certificate_236
  · exact certificate_237
  · exact certificate_238
  · exact certificate_239
  · exact certificate_240
  · exact certificate_241
  · exact certificate_242
  · exact certificate_243
  · exact certificate_244
  · exact certificate_245
  · exact certificate_246
  · exact certificate_247
  · exact certificate_248
  · exact certificate_249
  · exact certificate_250
  · exact certificate_251
  · exact certificate_252
  · exact certificate_253
  · exact certificate_254
  · exact certificate_255
  · exact certificate_256
  · exact certificate_257
  · exact certificate_258
  · exact certificate_259
  · exact certificate_260
  · exact certificate_261
  · exact certificate_262
  · exact certificate_263
  · exact certificate_264
  · exact certificate_265
  · exact certificate_266
  · exact certificate_267
  · exact certificate_268
  · exact certificate_269
  · exact certificate_270
  · exact certificate_271
  · exact certificate_272
  · exact certificate_273
  · exact certificate_274
  · exact certificate_275
  · exact certificate_276
  · exact certificate_277
  · exact certificate_278
  · exact certificate_279
  · exact certificate_280
  · exact certificate_281
  · exact certificate_282
  · exact certificate_283
  · exact certificate_284
  · exact certificate_285
  · exact certificate_286
  · exact certificate_287
  · exact certificate_288
  · exact certificate_289
  · exact certificate_290
  · exact certificate_291
  · exact certificate_292
  · exact certificate_293
  · exact certificate_294
  · exact certificate_295
  · exact certificate_296
  · exact certificate_297
  · exact certificate_298
  · exact certificate_299
  · exact certificate_300
  · exact certificate_301
  · exact certificate_302
  · exact certificate_303
  · exact certificate_304
  · exact certificate_305
  · exact certificate_306
  · exact certificate_307
  · exact certificate_308
  · exact certificate_309
  · exact certificate_310
  · exact certificate_311
  · exact certificate_312
  · exact certificate_313
  · exact certificate_314
  · exact certificate_315
  · exact certificate_316
  · exact certificate_317
  · exact certificate_318
  · exact certificate_319
  · exact certificate_320
  · exact certificate_321
  · exact certificate_322
  · exact certificate_323
  · exact certificate_324
  · exact certificate_325
  · exact certificate_326
  · exact certificate_327
  · exact certificate_328
  · exact certificate_329
  · exact certificate_330
  · exact certificate_331
  · exact certificate_332
  · exact certificate_333
  · exact certificate_334
  · exact certificate_335
  · exact certificate_336
  · exact certificate_337
  · exact certificate_338
  · exact certificate_339
  · exact certificate_340
  · exact certificate_341
  · exact certificate_342
  · exact certificate_343
  · exact certificate_344
  · exact certificate_345
  · exact certificate_346
  · exact certificate_347
  · exact certificate_348
  · exact certificate_349
  · exact certificate_350
  · exact certificate_351
  · exact certificate_352
  · exact certificate_353
  · exact certificate_354
  · exact certificate_355
  · exact certificate_356
  · exact certificate_357
  · exact certificate_358
  · exact certificate_359
  · exact certificate_360
  · exact certificate_361
  · exact certificate_362
  · exact certificate_363
  · exact certificate_364
  · exact certificate_365

/-- Complete bound through 365, apart from endpoints 61 and 62. -/
theorem sharp_bound_through_365 {n : ℕ} {A : Finset ℕ}
    (hn : n ≤ 365) (h61 : n ≠ 61) (h62 : n ≠ 62) (hA : Admissible n A) :
    reciprocalSum A ≤ 31 / 30 := by
  by_cases hn0 : n = 0
  · exact sharp_bound_of_le_five (by omega) hA
  by_cases he : n ∈ certificateExceptions
  · exact sharp_bound_at_small_exceptions n he h61 h62 A hA
  have hcert := certificate_through_365 n (by omega) hn
  apply (reciprocalSum_le_harmonicCertificate hA coefficient coefficient_nonneg _).trans
  · exact le_of_lt (hcert.2 he)
  · intro q hq hqn
    exact (certificate_through_365 q hq (hqn.trans hn)).1

end JSP.Problem000433
