# 📖 Ficheiros, Datas e Sistema — Referência Rápida

> [← Voltar à página principal](../README.md)

---

## `datetime` — datas e horas

```python
from datetime import datetime

agora = datetime.now()
print(agora)                              # 2026-09-11 19:32:05.123456
print(agora.strftime("%Y-%m-%d"))         # 2026-09-11
print(agora.strftime("%d/%m/%Y %H:%M"))   # 11/09/2026 19:32
print(agora.strftime("%Y%m%d_%H%M%S"))   # 20260911_193205  ← útil para nomes de ficheiros
```

### Formatos mais usados

| Código | Significado | Exemplo |
|---|---|---|
| `%Y` | Ano com 4 dígitos | `2026` |
| `%m` | Mês com 2 dígitos | `09` |
| `%d` | Dia com 2 dígitos | `11` |
| `%H` | Hora (00–23) | `19` |
| `%M` | Minutos | `32` |
| `%S` | Segundos | `05` |

### Usos típicos

```python
# Timestamp para relatório
timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
linha = f"Relatório gerado em: {timestamp}"

# Nome de ficheiro único
nome = f"backup_{datetime.now().strftime('%Y%m%d_%H%M%S')}.txt"
# → backup_20260911_193205.txt
```

---

## `os` — sistema de ficheiros

```python
import os
```

### Verificar e navegar

```python
os.getcwd()                        # pasta atual: 'C:/projetos/agentes'
os.path.exists("agentes.db")       # True se o ficheiro/pasta existe
os.path.isfile("agentes.db")       # True só se for ficheiro
os.path.isdir("dados/")            # True só se for pasta
os.listdir("dados/")               # ['agentes.db', 'seed.sql']
```

### Criar pastas

```python
os.makedirs("dados/aula10", exist_ok=True)
# exist_ok=True → não dá erro se a pasta já existir
```

### Trabalhar com paths

```python
os.path.dirname("dados/aula10/agentes.db")   # 'dados/aula10'
os.path.basename("dados/aula10/agentes.db")  # 'agentes.db'
os.path.join("dados", "aula10", "agentes.db")# 'dados/aula10/agentes.db'  ← usa sempre este
```

> 💡 Usa sempre `os.path.join()` para construir paths — funciona em Windows, Mac e Linux.

### Padrão típico: garantir que a pasta existe antes de criar o ficheiro

```python
import os

caminho = "dados/aula10/agentes.db"
os.makedirs(os.path.dirname(caminho), exist_ok=True)
# agora é seguro abrir/criar o ficheiro
```

---

## `open()` — ler e escrever ficheiros de texto

```python
# Escrever (cria ou substitui)
with open("relatorio.txt", "w", encoding="utf-8") as f:
    f.write("linha 1\n")
    f.write("linha 2\n")

# Acrescentar ao fim
with open("log.txt", "a", encoding="utf-8") as f:
    f.write("nova entrada\n")

# Ler tudo de uma vez
with open("relatorio.txt", "r", encoding="utf-8") as f:
    conteudo = f.read()

# Ler linha a linha
with open("relatorio.txt", "r", encoding="utf-8") as f:
    for linha in f:
        print(linha.strip())
```

### Modos de abertura

| Modo | Significado |
|---|---|
| `"r"` | Ler (erro se não existir) |
| `"w"` | Escrever (cria ou apaga o conteúdo anterior) |
| `"a"` | Acrescentar ao fim |
| `"x"` | Criar (erro se já existir) |

> 💡 Usa sempre `encoding="utf-8"` para garantir acentos corretos em qualquer sistema.

### Com tratamento de erros

```python
try:
    with open("relatorio.txt", "w", encoding="utf-8") as f:
        f.write("dados...")
except PermissionError:
    print("❌ Sem permissão para escrever.")
except OSError as e:
    print(f"❌ Erro no ficheiro: {e}")
```

---

## Padrão completo — exportar relatório com timestamp

```python
import os
from datetime import datetime

def exportar(rows):
    try:
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        linhas = [f"Relatório — {timestamp}", "=" * 40]
        for r in rows:
            linhas.append(f"{r['codename']:<12} nível {r['nivel']}")

        with open("relatorio_agentes.txt", "w", encoding="utf-8") as f:
            f.write("\n".join(linhas) + "\n")

        print("✅ Relatório exportado com sucesso.")
    except PermissionError:
        print("❌ Sem permissão para escrever o ficheiro.")
    except OSError as e:
        print(f"❌ Erro ao escrever: {e}")
```

---

*UC00606 · Linguagem Estruturada · ETP Sicó · 2025/2026*
