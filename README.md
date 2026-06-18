# tesis-nbody-unfv

**Comparación empírica de los criterios analíticos de estabilidad planetaria de Holman-Wiegert y Mardling-Aarseth mediante barridos numéricos tridimensionales en los sistemas estelares triples jerárquicos HD 188753 y KOI-5.**

Tesis de Licenciatura en Física — Universidad Nacional Federico Villarreal (UNFV).

- **Autor**: Juan Angelo Calatayud Fernández
- **Asesor**: Bernabé Alonso Mejía Cordero
- **Año**: 2026

---

## Pregunta científica

¿Cuál de los dos criterios analíticos clásicos de estabilidad planetaria —Holman & Wiegert (1999) y Mardling & Aarseth (2001)— predice con mayor precisión el límite empírico de estabilidad de planetas circunestelares en sistemas estelares triples jerárquicos cuando se compara contra barridos numéricos tridimensionales sobre HD 188753 y KOI-5?

## Hipótesis

El límite empírico de estabilidad es **régimen-dependiente**: HD 188753 (par binario externo cerrado) y KOI-5 (par binario externo amplio con planeta confirmado KOI-5Ab) exhiben sensibilidades distintas a los criterios. Adicionalmente, la posición orbital del candidato retractado KOI-5.02 (a≈0.075 UA, e≈0) cae dentro de la zona dinámicamente viable predicha por el barrido, respaldando que su rechazo fue observacional y no dinámico.

## Metodología

- **Test particle approach** en ambos sistemas
- **Tiempo de integración**: 10⁵ años
- **Grilla**: 10×10×3×3 = 900 (prueba) → 50×50×5×3 = 37,500 nodos (final)
- **Variables**: semieje mayor (a), excentricidad (e), inclinación (i), anomalía media inicial (M₀)
- **Integrador**: Julia `KahanLi8` (simpléctico de octavo orden, alta conservación de invariantes)
- **Jerarquía de validación numérica** (sin cruzar lenguajes):
  1. Conservación de energía y momento angular (cada simulación)
  2. Test analítico kepleriano (caso de referencia antes del barrido)
  3. Validación contra JPL Horizons (trayectoria de Artemis II)

## Estructura

```
tesis-nbody-unfv/
├── README.md
├── LICENSE                       # MIT
├── .gitignore
├── .devcontainer/                # GitHub Codespaces (Julia + Python)
│   ├── devcontainer.json
│   └── setup.sh
├── codigo/
│   ├── julia/                    # Integrador simpléctico KahanLi8
│   │   └── Project.toml
│   └── python/                   # Figuras y post-procesamiento
│       └── requirements.txt
├── datos/                        # Condiciones iniciales JPL Horizons
├── resultados/                   # Salidas de simulaciones (gitignored)
└── docs/                         # Notas de metodología
```

## Reproducibilidad

- Julia 1.10+ (entorno principal de simulación)
- MATLAB R2022a+ (visualización de mapas de estabilidad + Symbolic Math Toolbox para criterios analíticos)
- Python 3.11+ (análisis estadístico y consulta de archivos NASA)
- Semillas RNG documentadas en cada script
- Condiciones iniciales obtenidas de JPL Horizons

## Abrir en Codespaces

1. Click en **Code** → **Codespaces** → **Create codespace on main**
2. Espera ~3 min mientras se instalan Julia y Python
3. Verifica instalación:
   ```bash
   julia --version
   python --version
   ```

## Licencia

MIT — ver [LICENSE](LICENSE)

## Citar

```
Calatayud Fernández, J. A. (2026). Comparación empírica de los criterios analíticos
de estabilidad planetaria de Holman-Wiegert y Mardling-Aarseth mediante barridos
numéricos tridimensionales en los sistemas estelares triples jerárquicos HD 188753
y KOI-5 [Tesis de licenciatura, Universidad Nacional Federico Villarreal].
```
