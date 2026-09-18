import platform
import sys

print("Implementação:", platform.python_implementation())
print("Versão:", sys.version.replace("\n", " "))

if hasattr(sys, "_is_gil_enabled"):
    print("GIL habilitado:", sys._is_gil_enabled())
else:
    print(
        "Este interpretador não oferece sys._is_gil_enabled()."
    )
