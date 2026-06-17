#!/usr/bin/env bash
set -euo pipefail

echo "======================================"
echo "  Setup tesis-nbody-unfv"
echo "  Julia + Python para simulación N-cuerpos"
echo "======================================"

# --- 1. Python: dependencias de análisis y figuras ---
echo ""
echo "[1/3] Instalando dependencias Python..."
pip install --upgrade pip
if [ -f "codigo/python/requirements.txt" ]; then
  pip install -r codigo/python/requirements.txt
fi

# --- 2. Julia: instanciar Project.toml ---
echo ""
echo "[2/3] Instanciando paquetes Julia..."
if [ -f "codigo/julia/Project.toml" ]; then
  cd codigo/julia
  julia --project=. -e 'using Pkg; Pkg.instantiate(); Pkg.precompile()'
  cd -
fi

# --- 3. Verificacion ---
echo ""
echo "[3/3] Verificacion de instalacion..."
echo ""
echo "Julia:  $(julia --version)"
echo "Python: $(python --version)"
echo ""
echo "Paquetes Julia instalados:"
julia -e 'using Pkg; Pkg.status()' --project=codigo/julia

echo ""
echo "======================================"
echo "  Setup completo. Listo para trabajar."
echo "======================================"
