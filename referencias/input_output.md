# 📖 Referência — Input e Output

> [← Voltar à página principal](../README.md)

---

## `input()` — ler dados do utilizador

```python
# Lê sempre uma STRING
texto = input("Escreve algo: ")

# Para números, tens de converter
idade   = int(input("Idade: "))
altura  = float(input("Altura (metros): "))
```

### Padrão seguro com validação

```python
try:
    idade = int(input("Idade: "))
except ValueError:
    print("Erro: introduz um número inteiro.")
```

---

## `print()` — mostrar resultados

```python
# Texto simples
print("Olá, mundo!")

# Variável
nome = "Ana"
print(nome)

# Vários valores (separados por espaço)
print("Olá,", nome, "!")

# Separador personalizado
print("A", "B", "C", sep="-")    # → A-B-C

# Sem nova linha no final
print("A carregar", end="")
print("...")                       # → A carregar...

# Linha vazia
print()
```

---

## f-strings — a forma recomendada de formatar

```python
nome  = "Joana"
nivel = 8
nota  = 17.666

# Básico
print(f"Bem-vindo, {nome}!")                  # → Bem-vindo, Joana!

# Expressão dentro de {}
print(f"Nível em %: {nivel * 10}%")           # → Nível em %: 80%

# Casas decimais
print(f"Nota: {nota:.1f}")                    # → Nota: 17.7
print(f"Nota: {nota:.2f}")                    # → Nota: 17.67

# Alinhamento
print(f"{'Nome':<12} {'Nota':>6}")            # cabeçalho
print(f"{nome:<12} {nota:>6.1f}")             # dados
# →  Nome          Nota
# →  Joana         17.7

# Número com zeros à esquerda
n = 7
print(f"Exercício #{n:02d}")                  # → Exercício #07

# Inteiro com separador de milhar
grande = 1234567
print(f"{grande:,}")                          # → 1,234,567
```

---

## Caixa de texto formatada (padrão útil)

```python
nome  = "Maria Silva"
nivel = "Avançado"
nota  = 18

largura = 46
print("╔" + "═" * largura + "╗")
print(f"║{'PERFIL DO AGENTE':^{largura}}║")
print("╠" + "═" * largura + "╣")
print(f"║  Nome:   {nome:<{largura-10}}║")
print(f"║  Nível:  {nivel:<{largura-10}}║")
print(f"║  Nota:   {nota:<{largura-10}}║")
print("╚" + "═" * largura + "╝")
```

Resultado:
```
╔══════════════════════════════════════════════╗
║            PERFIL DO AGENTE                  ║
╠══════════════════════════════════════════════╣
║  Nome:   Maria Silva                         ║
║  Nível:  Avançado                            ║
║  Nota:   18                                  ║
╚══════════════════════════════════════════════╝
```

---

## Caracteres especiais em strings

| Código | Resultado |
|--------|-----------|
| `\n` | Nova linha |
| `\t` | Tabulação (tab) |
| `\\` | Barra invertida `\` |
| `\"` | Aspas duplas dentro de string |
| `\'` | Aspas simples dentro de string |

```python
print("Linha 1\nLinha 2")    # duas linhas
print("Col1\tCol2")          # separado por tab
```

---

<sub>← [Voltar](../README.md) · [Semana 1](../semanas/semana01.md)</sub>
