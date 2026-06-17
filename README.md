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
- **Grilla**: 10×10×3×3 (prueba) → 30×30×5×3 = 13,500 nodos (final)
- **Variables**: semieje mayor (a), excentricidad (e), inclinación (i), anomalía media inicial (M₀)
- **Integradores comparados**:
  - MATLAB `ode45` (RK45, no simpléctico)
  - Julia `KahanLi8` (simpléctico de octavo orden)
- **Validación cruzada** entre ambos integradores

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
│   ├── julia/                    # Integradores simplécticos
│   │   └── Project.toml
│   ├── python/                   # Figuras y post-procesamiento
│   │   └── requirements.txt
│   └── matlab/                   # Validación cruzada (ode45)
├── datos/                        # Condiciones iniciales JPL Horizons
├── resultados/                   # Salidas de simulaciones (gitignored)
└── docs/                         # Notas de metodología
```

## Reproducibilidad

- Julia 1.10+
- Python 3.11+
- MATLAB R2024a+ (opcional, solo validación cruzada)
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
