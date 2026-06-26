# 📖 Referência — Coleções Python

> [← Voltar à página principal](../README.md)

---

## Visão geral — qual escolher?

| Estrutura | Ordenada | Mutável | Repetidos | Acesso |
|-----------|----------|---------|-----------|--------|
| `list` | Sim | Sim | Sim | Índice |
| `tuple` | Sim | Não | Sim | Índice |
| `set` | Não | Sim | Não | Pertença |
| `dict` | Sim* | Sim | Chaves únicas | Chave |
| `str` | Sim | Não | Sim | Índice |
| `range` | Sim | Não | N/A | Sequência |

\* Desde Python 3.7

---

## Lista (`list`)

Pensa numa **fila de espera** — tem ordem, podes adicionar, remover e alterar.

```python
agentes = ["Ana", "Bruno", "Carla"]
numeros = [10, 20, 30, 40]
mista   = ["Ana", 21, True]   # pode misturar tipos
vazia   = []
```

### Acesso por índice

```python
agentes[0]    # → "Ana"    (primeiro)
agentes[-1]   # → "Carla"  (último)
agentes[1:3]  # → ["Bruno", "Carla"]  (slicing)
```

### Operações comuns

```python
agentes.append("Daniel")     # adicionar ao fim
agentes.insert(1, "Eva")     # inserir na posição 1
agentes.remove("Bruno")      # remover por valor
agentes.pop()                # remover o último
agentes.pop(0)               # remover o primeiro
agentes[0] = "Alice"         # alterar

len(agentes)                 # comprimento
"Ana" in agentes             # verificar existência → True
agentes.sort()               # ordenar (modifica a lista)
agentes.reverse()            # inverter
agentes.index("Carla")       # posição de um elemento
agentes.count("Ana")         # quantas vezes aparece
```

### Percorrer

```python
for agente in agentes:
    print(agente)

# Com índice
for i, agente in enumerate(agentes):
    print(f"{i}: {agente}")
```

**Quando usar:** guardar sequências de coisas que podem mudar — listas de alunos, resultados, histórico.

---

## Tuplo (`tuple`)

Pensa numa **fotografia** — depois de criado, não pode ser alterado.

```python
ponto    = (10, 20)
gps      = (40.123, -8.456)
cor_rgb  = (255, 128, 0)
unitario = (42,)    # tuplo com um elemento — a vírgula é obrigatória
```

### Acesso

```python
gps[0]    # → 40.123
gps[-1]   # → -8.456
```

```python
gps[0] = 50   # ← ERRO — tuplos não são mutáveis
```

### Desempacotamento

```python
x, y = ponto          # x = 10, y = 20
lat, lon = gps
r, g, b = cor_rgb
```

**Quando usar:** coordenadas, datas, cores RGB, valores de configuração — dados que não devem mudar.

---

## Set (`set`)

Pensa num **saco de bolas** — sabes o que está lá dentro, mas não há posição definida.

```python
nomes   = {"Ana", "João", "Rita"}
numeros = {1, 2, 3, 4}
vazio   = set()   # atenção: {} cria um dict, não um set
```

```python
nomes.add("Pedro")      # adicionar
nomes.remove("Ana")     # remover (erro se não existir)
nomes.discard("Xpto")   # remover sem erro

"João" in nomes    # verificar existência → True
len(nomes)         # número de elementos
```

> ⚠️ Não existe `nomes[0]` — os sets não têm índice.

### Operações entre conjuntos

```python
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}

a | b    # união → {1, 2, 3, 4, 5, 6}
a & b    # interseção → {3, 4}
a - b    # diferença → {1, 2}
```

### Eliminar duplicados de uma lista

```python
passwords = ["1234", "admin", "1234", "qwerty"]
unicas = list(set(passwords))
```

**Quando usar:** verificar rapidamente se algo existe, eliminar duplicados, operações de conjuntos.

---

## Dicionário (`dict`)

Pensa numa **agenda telefónica** — associa uma chave a um valor.

```python
agente = {
    "nome":  "Ana",
    "nivel": "ADMIN",
    "ativo": True,
    "idade": 28
}
vazio = {}
```

### Acesso e modificação

```python
agente["nome"]           # → "Ana"
agente.get("email")      # → None (sem erro se não existir)
agente.get("email", "sem email")   # → "sem email" (valor por omissão)

agente["nivel"] = "USER"   # alterar
agente["email"] = "a@b.c"  # adicionar nova chave
del agente["idade"]         # remover chave
```

### Verificar existência

```python
"nome" in agente    # → True  (verifica chaves)
```

### Percorrer

```python
# Só chaves
for chave in agente:
    print(chave)

# Só valores
for valor in agente.values():
    print(valor)

# Chaves e valores
for chave, valor in agente.items():
    print(f"{chave}: {valor}")
```

### Lista de dicionários — padrão comum

```python
agentes = [
    {"nome": "Ana",   "nivel": "ADMIN", "ativo": True},
    {"nome": "Bruno", "nivel": "USER",  "ativo": False},
]

for a in agentes:
    print(a["nome"], a["nivel"])
```

**Quando usar:** representar um objeto com várias propriedades, pesquisa rápida por chave.

---

## String (`str`)

Uma string comporta-se como uma coleção de caracteres.

```python
nome = "Belmiro"

nome[0]     # → "B"
nome[-1]    # → "o"
nome[1:4]   # → "elm"
len(nome)   # → 7

for letra in nome:
    print(letra)
```

> Strings são **não mutáveis** — não podes fazer `nome[0] = "b"`.

Consulta a referência completa de strings: [strings.md](strings.md)

---

## Range (`range`)

O `range` gera números automaticamente — não armazena todos em memória.

```python
range(5)          # 0, 1, 2, 3, 4
range(1, 6)       # 1, 2, 3, 4, 5
range(0, 10, 2)   # 0, 2, 4, 6, 8   (passo 2)
range(10, 0, -1)  # 10, 9, 8, ..., 1 (decrescente)
```

```python
for i in range(3):
    print(f"Tentativa {i + 1}")

list(range(5))   # → [0, 1, 2, 3, 4]  (converter para lista)
```

**Quando usar:** repetir N vezes, gerar índices, percorrer com passo.

---

## Regra prática — qual estrutura escolher?

- **Lista** → "Quero guardar uma sequência de coisas que pode mudar."
- **Tuplo** → "Quero dados fixos que não devem ser alterados."
- **Set** → "Quero evitar duplicados ou verificar existência rapidamente."
- **Dicionário** → "Quero associar uma chave (nome) a um valor."
- **Range** → "Quero gerar números automaticamente."

---

<sub>← [Voltar](../README.md) · [Semana 4](../semanas/semana04.md)</sub>
