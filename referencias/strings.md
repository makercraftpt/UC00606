# 📖 Referência — Strings & Regex

> [← Voltar à página principal](../README.md)

---

## Métodos de string mais usados

```python
nome = "  Agente Cyber  "

nome.strip()          # 'Agente Cyber'      — remove espaços das pontas
nome.upper()          # '  AGENTE CYBER  '  — maiúsculas
nome.lower()          # '  agente cyber  '  — minúsculas
nome.replace("a", "@") # substitui todas as ocorrências
nome.find("Cyber")    # posição onde começa (-1 se não existir)
```

```python
log = "ERRO IP falha login"
log.split(" ")         # ['ERRO', 'IP', 'falha', 'login']

partes = ["ERRO", "IP", "falha"]
" ".join(partes)       # 'ERRO IP falha'
```

> ⚠️ Strings são **imutáveis** — nenhum destes métodos altera a string original, todos devolvem um valor novo.

---

## Slicing — `texto[inicio:fim:passo]`

```python
ip = "192.168.1.45"

ip[0]        # '1'         — 1º carácter
ip[0:3]      # '192'       — do índice 0 até (sem incluir) o 3
ip[:3]       # '192'       — do início até ao índice 3
ip[4:]       # '68.1.45'   — do índice 4 até ao fim
ip[-1]       # '5'         — último carácter
ip[-2:]      # '45'        — os últimos 2 caracteres
ip[::-1]     # '54.1.861.291' — passo -1 = string invertida
```

> 💡 Slicing nunca dá erro de índice, mesmo fora dos limites — devolve uma string vazia ou parcial.

---

## f-strings — formatação avançada

```python
nome = "Ana"
pontos = 87.456

print(f"{nome:10}")       # alinhado à esquerda em 10 espaços
print(f"{pontos:.2f}")    # '87.46' — 2 casas decimais
print(f"{pontos:>10.1f}") # alinhado à direita, 1 casa decimal
```

---

## `import re` — expressões regulares

Quando os métodos de string já não chegam (o formato varia, a posição não é fixa), usamos **regex**.

```python
import re

texto = "login OK, IP 10.0.0.5"
m = re.search(r"\d+\.\d+\.\d+\.\d+", texto)

if m:
    print(m.group())    # '10.0.0.5'
else:
    print("sem padrão encontrado")
```

### `re.search()` vs `re.findall()`

```python
logs = "IP 1.1.1.1 e IP 2.2.2.2 falharam"
padrao = r"\d+\.\d+\.\d+\.\d+"

re.search(padrao, logs)     # devolve o 1º Match, ou None
re.findall(padrao, logs)    # devolve uma LISTA com todos: ['1.1.1.1', '2.2.2.2']
```

| Função | Para quando encontra | Devolve |
|--------|----------------------|---------|
| `re.search()` | No 1º resultado | Um `Match` (ou `None`) |
| `re.findall()` | Não para — percorre tudo | Uma lista (vazia se não houver) |

### Métodos úteis do `Match`

```python
m = re.search(r"\d+", "porta 8080 aberta")

m.group()   # '8080'   — o texto encontrado
m.start()   # 6        — posição onde começa
m.span()    # (6, 10)  — (início, fim)
```

---

## Padrões comuns — cheatsheet

```
IP:        \d{1,3}(\.\d{1,3}){3}
Email:     \S+@\S+\.\S+
Timestamp: \d{2}:\d{2}:\d{2}

\d = dígito           \S = qualquer coisa que não seja espaço
+  = 1 ou mais         {n} = exatamente n vezes
.  = qualquer carácter (\. = ponto literal)
```

```python
log = "14:32:07 IP=10.0.0.5"

hora = re.search(r"\d{2}:\d{2}:\d{2}", log)
ip   = re.search(r"\d{1,3}(\.\d{1,3}){3}", log)

print(hora.group())  # '14:32:07'
print(ip.group())    # '10.0.0.5'
```

---

## Boas práticas

- **Usa `r'...'` (raw string)** — evita ter de duplicar as barras invertidas (`\\d` vira `\d`).
- **Compila padrões repetidos** com `re.compile()` se os fores usar muitas vezes num loop.
- **Testa o padrão** num site como [regex101.com](https://regex101.com) antes de o usar no código.
- **Comenta o que o padrão faz** — regex é difícil de reler passado um tempo.

```python
# ✔ Bom
padrao = re.compile(r"\d{1,3}(\.\d{1,3}){3}")   # padrão de IP
resultado = padrao.findall(texto)

# ✘ Evitar
resultado = re.findall(r"\d{1,3}(\.\d{1,3}){3}", texto)  # recompila a cada chamada
```

---

## Erros comuns

```python
# ❌ Esquecer que search() pode devolver None
m = re.search(padrao, texto)
print(m.group())     # AttributeError se não encontrar nada!

# ✅ Verificar sempre antes de usar .group()
if m:
    print(m.group())

# ❌ Barras invertidas sem raw string
padrao = "\d+"        # \d pode não fazer o que esperas
padrao = r"\d+"        # ✔ correto

# ❌ Usar find() quando é preciso um padrão flexível
log.find("192.168")   # só encontra esse IP exato

# ✅ Usar regex quando o formato varia
re.search(r"\d{1,3}(\.\d{1,3}){3}", log)   # encontra qualquer IP
```

---

<sub>← [Voltar](../README.md) · [Semana 7](../semanas/semana07.md)</sub>
