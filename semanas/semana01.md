# 📅 Semana 1 — Bem-vindos à Matrix

> **UC00606 · Linguagem Estruturada · Aula 1**  
> Tema: Variáveis · `input()` · `print()` · f-strings

---

## 🎯 O que aprendemos esta semana

- Criar e usar **variáveis**
- Ler dados do utilizador com **`input()`**
- Mostrar resultados com **`print()`**
- Formatar texto com **f-strings**
- Trabalhar com **tipos de dados** básicos

---

## ⚡ Resumo rápido — o essencial

### Variáveis

```python
nome = "Ana"          # string (texto)
idade = 22            # int (inteiro)
altura = 1.72         # float (decimal)
ativo = True          # bool (verdadeiro/falso)
```

> 💡 O nome de uma variável não pode ter espaços nem começar com número.

---

### `input()` — ler dados do utilizador

```python
nome = input("Qual o teu nome? ")      # lê texto
ano  = int(input("Ano de nascimento: "))   # lê e converte para inteiro
nota = float(input("Nota: "))          # lê e converte para decimal
```

> ⚠️ `input()` devolve **sempre uma string**. Para fazer contas, tens de converter com `int()` ou `float()`.

---

### `print()` — mostrar resultados

```python
print("Olá, mundo!")                   # texto simples
print(nome)                            # variável
print("Olá,", nome)                   # texto + variável
print(f"Olá, {nome}! Tens {idade} anos.")  # f-string (recomendado)
```

---

### f-strings — formatação de texto

```python
nome  = "João"
nivel = 7
nota  = 18.5

# Básico
print(f"Bem-vindo, {nome}!")

# Com cálculo dentro
print(f"Classificação: {nivel * 10}%")

# Formatação de casas decimais
print(f"Nota: {nota:.1f}")    # → 18.5
print(f"Nota: {nota:.2f}")    # → 18.50

# Alinhamento (útil para tabelas)
print(f"{'Nome':<15} {'Nota':>5}")   # alinha esquerda / direita
print(f"{nome:<15} {nota:>5.1f}")
```

---

### Tipos de dados e conversão

| Tipo | Exemplo | Converter com |
|------|---------|--------------|
| `str` — texto | `"olá"`, `"123"` | `str(x)` |
| `int` — inteiro | `42`, `-7` | `int(x)` |
| `float` — decimal | `3.14`, `-1.5` | `float(x)` |
| `bool` — lógico | `True`, `False` | `bool(x)` |

```python
# Ver o tipo de uma variável
x = 42
print(type(x))    # → <class 'int'>
```

---

## 🧩 Exercícios desta semana

| # | Nome | Dificuldade |
|---|------|-------------|
| [#1](../exercicios/aula1.md#exercício-1) | Cartão de Identidade de Agente | ★ Fácil |
| [#6](../exercicios/aula1.md#exercício-6) | Perfil de Sistema | ★★ Médio |
| [#9](../exercicios/aula1.md#exercício-9) | Conversor IPv4 para Binário | ★★★ Difícil |

---

## 🐞 Erros comuns desta semana

```python
# ❌ Esquecer de converter input para número
idade = input("Idade: ")
print(idade + 1)          # → TypeError!

# ✅ Correto
idade = int(input("Idade: "))
print(idade + 1)          # → funciona

# ❌ Aspas por fechar
nome = "Ana              # → SyntaxError

# ❌ Variável não definida
print(Nome)              # → NameError (Python é case-sensitive!)
print(nome)              # ✅ correto
```

---

## 🔗 Referências úteis

- [📖 Variáveis e tipos](../referencias/variaveis.md)
- [📖 Input e Output](../referencias/input_output.md)
- [Documentação oficial Python (PT)](https://docs.python.org/pt-br/3/)

---

<sub>← [Página principal](../README.md) · Semana 2 → (em breve)</sub>
