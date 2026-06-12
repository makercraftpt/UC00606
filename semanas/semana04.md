# 📅 Semana 4 — Ciclos: `for` + Listas

> **UC00606 · Linguagem Estruturada · Aula 4**  
> Tema: Ciclo `for` · `range()` · Listas · Padrão acumulador · Coleções Python

---

## 🎯 O que aprendemos esta semana

- Repetir código com **`for`** para percorrer sequências
- Gerar números automáticos com **`range()`** — início, fim e passo
- Criar e manipular **listas** com índices e `append()`
- Aplicar o **padrão acumulador** — soma, contador e máximo
- Construir listas dinamicamente dentro de um ciclo
- Comparar `for` e `while` — quando usar cada um
- Conhecer as principais **coleções Python**: lista, tuplo, set, dicionário
- Evoluir a **Missão Contínua** para a versão 0.4

---

## ⚡ Resumo rápido — o essencial

### O ciclo `for`

```python
for variavel in sequencia:
    # código a repetir
```

> Usa-se quando **sabemos** quantas vezes vamos repetir (ou quando percorremos uma coleção).

---

### `range()` — três formas

```python
range(5)          # 0, 1, 2, 3, 4
range(2, 6)       # 2, 3, 4, 5
range(0, 10, 2)   # 0, 2, 4, 6, 8
```

Contagem decrescente:

```python
for i in range(10, 0, -1):
    print(i)   # 10, 9, 8, ..., 1
```

---

### Listas

```python
frutas = ["maçã", "banana", "pera"]

frutas.append("kiwi")     # adicionar ao fim
frutas.remove("banana")   # remover por valor
frutas[0] = "laranja"     # alterar por índice
print(frutas[0])          # aceder por índice
```

Percorrer uma lista:

```python
for fruta in frutas:
    print(fruta)
```

---

### O que significa "ordenada"?

Não significa ordenada por valor — significa que o Python preserva a posição de cada elemento.

```python
vulnerabilidades = [7, 3, 9, 2]
# posição 0 → 7 | posição 1 → 3 | posição 2 → 9 | posição 3 → 2
```

---

### Padrão acumulador

```python
numeros = [7, 3, 9, 2, 8]

total = 0
maior = 0
conta = 0

for n in numeros:
    total += n          # soma
    if n > maior:
        maior = n       # máximo
    if n >= 7:
        conta += 1      # contador condicional

print(f"Total: {total} | Maior: {maior} | Críticos: {conta}")
```

---

### `append()` — construir listas dinamicamente

```python
riscos = [7, 3, 9, 2, 8, 5, 6, 10, 1, 4]
criticos = []

for risco in riscos:
    if risco >= 8:
        criticos.append(risco)

print(criticos)   # [9, 8, 10]
```

---

## 🗂️ Coleções Python — referência rápida

### 1. Lista (`list`)

A estrutura mais utilizada em Python. Pensa nela como uma **fila** ou uma **mochila**.

```python
frutas = ["maçã", "banana", "pera"]
numeros = [1, 2, 2, 3]   # permite repetidos
```

**Características:** ordenada · mutável · permite repetidos · acesso por índice

```python
frutas.append("kiwi")     # adicionar
frutas.remove("banana")   # remover
frutas[0] = "laranja"     # alterar
print(frutas[0])          # aceder
```

---

### 2. Tuplo (`tuple`)

Pensa num tuplo como uma **fotografia** — depois de criado, não pode ser alterado.

```python
ponto = (10, 20)
gps = (40.123, -8.456)
```

**Características:** ordenado · **não mutável** · permite repetidos · acesso por índice

```python
gps[0] = 50   # ← ERRO! Tuplos não são mutáveis
```

**Quando usar:** coordenadas GPS, datas, cores RGB, configurações fixas — dados que não devem mudar.

---

### 3. Set (`set`)

Pensa num set como um **saco de bolas** — sabes o que está lá dentro, mas não há posição definida.

```python
nomes = {"Ana", "João", "Rita"}
```

**Características:** **não ordenado** · mutável · **não permite repetidos**

```python
nomes.add("Pedro")    # adicionar
nomes.remove("Ana")   # remover

if "João" in nomes:   # verificar existência
    print("Existe")
```

> ⚠️ Não existe `nomes[0]` — os sets não têm índice.

**Exemplo útil — eliminar duplicados:**

```python
passwords = ["1234", "admin", "1234", "qwerty"]
unicas = set(passwords)
print(unicas)   # {'1234', 'admin', 'qwerty'}
```

---

### 4. Dicionário (`dict`)

Pensa numa **agenda telefónica** — associa uma chave a um valor.

```python
idades = {
    "Ana": 20,
    "João": 18
}
```

**Características:** mantém a ordem de inserção\* · mutável · chaves únicas · pesquisa muito rápida

```python
print(idades["Ana"])   # consultar
idades["Ana"] = 21     # alterar
idades["Pedro"] = 22   # adicionar nova chave
```

\* Desde Python 3.7 os dicionários mantêm a ordem de inserção.

---

### 5. String (`str`)

Uma string é uma sequência de caracteres — e comporta-se como uma coleção.

```python
nome = "Belmiro"
print(nome[0])    # B

for letra in nome:
    print(letra)  # B, e, l, m, i, r, o
```

**Características:** ordenada · **não mutável** · permite repetidos · acesso por índice

---

### 6. Range (`range`)

O `range` gera números automaticamente — não armazena todos os valores em memória.

```python
range(5)       # 0, 1, 2, 3, 4
range(2, 6)    # 2, 3, 4, 5
range(0, 10, 2)   # 0, 2, 4, 6, 8
```

**Características:** ordenado · não mutável · sem repetidos · gerado sob pedido

---

## 📊 Comparação das coleções

| Estrutura | Ordenada | Mutável | Repetidos | Acesso |
|-----------|----------|---------|-----------|--------|
| Lista | Sim | Sim | Sim | Índice |
| Tuplo | Sim | Não | Sim | Índice |
| Set | Não | Sim | Não | Pertença |
| Dicionário | Sim\* | Sim | Chaves únicas | Chave |
| String | Sim | Não | Sim | Índice |
| Range | Sim | Não | N/A | Sequência |

\* Desde Python 3.7

---

## 🔄 `for` vs `while` — quando usar cada um

### `for` — quando sabemos o que vamos percorrer

```python
for aluno in alunos:
    print(aluno)

for i in range(10):
    print(i)
```

### `while` — quando não sabemos quando vai terminar

```python
pin = ""
while pin != "1234":
    pin = input("PIN: ")
```

---

## 🧭 Regra prática — qual estrutura escolher?

- **Lista** → "Quero guardar uma fila de coisas."
- **Tuplo** → "Quero guardar dados fixos que não devem mudar."
- **Set** → "Quero saber rapidamente se algo existe e evitar duplicados."
- **Dicionário** → "Quero associar uma chave a um valor."
- **Range** → "Quero gerar números automaticamente."
- **`for`** → "Faz isto para cada elemento."
- **`while`** → "Repete até acontecer alguma coisa."

> 💡 Se dominares **listas**, **`for`**, **`range()`**, **dicionários** e **`while`**, já consegues resolver a grande maioria dos programas introdutórios em Python.

---

## 🔒 Missão Contínua — v0.4

Esta semana o simulador ganhou **gestão de múltiplos agentes com listas e `for`**:

```python
# ═══════════════════════════════════════════════
# MISSÃO CONTÍNUA — Simulador de Hacking v0.4
# ═══════════════════════════════════════════════

print("=" * 48)
print("  SISTEMA DE CONTROLO — CyberBase Alpha v0.4")
print("=" * 48)

agentes = [
    {"nome": "Ana",   "nivel": "ADMIN", "ativo": True},
    {"nome": "Bruno", "nivel": "USER",  "ativo": False},
    {"nome": "Carla", "nivel": "GUEST", "ativo": True},
]

print("\n--- Relatório de Agentes ---")
total  = 0
ativos = 0

for agente in agentes:
    total += 1
    estado = "ATIVO" if agente["ativo"] else "INATIVO"
    if agente["ativo"]:
        ativos += 1
    print(f'  {agente["nome"]:10} [{agente["nivel"]:5}] -- {estado}')

print(f"\nTotal: {total} agentes | Ativos: {ativos}")
```

Saída esperada:

```
--- Relatório de Agentes ---
  Ana        [ADMIN] -- ATIVO
  Bruno      [USER ] -- INATIVO
  Carla      [GUEST] -- ATIVO

Total: 3 agentes | Ativos: 2
```

> Na próxima versão (v0.5) vamos adicionar funções para organizar melhor o código. 🔧

---

## 📚 Para aprofundar

- [Referência — Ciclos](../referencias/ciclos.md) — Sintaxe completa, padrões e exemplos
- [Documentação oficial Python — `for`](https://docs.python.org/pt/3/reference/compound_stmts.html#the-for-statement)
- [Documentação oficial Python — Listas](https://docs.python.org/pt/3/tutorial/datastructures.html)
- [Documentação oficial Python — `range`](https://docs.python.org/pt/3/library/stdtypes.html#range)

---

## 💻 Exercícios desta semana

| Ficha | Dificuldade | Tema |
|-------|-------------|------|
| Ficha B | ★★ Médio | Relatório de Vulnerabilidades — `for` + acumulador + classificação |
| Ficha A | ★ Fácil | Missão de Reconhecimento — `range()`, listas de alvos, filtro com `in` |
| Ficha C | ★★★ Difícil | Análise de Tráfego de Rede — `append()`, percentagens, classificação |
| Ficha Extra | 🏠 Casa | 5 desafios extra com XP — do mais difícil para o mais fácil |

> As fichas em PDF estão disponíveis na pasta `exercicios/`.

---

<sub>UC00606 · Linguagem Estruturada · ETPS · 2025/2026 · Semana 4</sub>
