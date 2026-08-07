# ✅ Resolução — Aula 3: Ciclos `while`

> **UC00606 · Linguagem Estruturada · ETPS · 2025/2026**  
> Ficheiro para uso do professor — não distribuir aos alunos antes da aula.

---

## Ficha B ★★ — Guardião da Porta

### Solução base

```python
print("--- SISTEMA DE CONTROLO ---")

tentativas = 0
while tentativas < 3:
    pin = input(f"Tentativa {tentativas + 1}/3 - Introduz o PIN: ")
    if pin == "4821":
        print(f"Acesso concedido! Bem-vindo ao sistema.")
        print(f"Conseguiste entrar na tentativa {tentativas + 1}.")
        break
    tentativas += 1
    if tentativas < 3:
        print("PIN incorreto. Tenta novamente.")
else:
    print("SISTEMA BLOQUEADO. Demasiadas tentativas falhadas.")
```

### Solução com desafio extra (+10 XP)

```python
print("--- SISTEMA DE CONTROLO ---")

tentativas = 0
while tentativas < 3:
    pin = input(f"Tentativa {tentativas + 1}/3 - Introduz o PIN: ")
    if pin == "4821":
        print(f"Acesso concedido! Bem-vindo ao sistema.")
        print(f"Conseguiste entrar na tentativa {tentativas + 1}.")
        break
    tentativas += 1
    if tentativas < 3:
        print("PIN incorreto. Tenta novamente.")
else:
    espera = tentativas * 60  # 1 minuto por tentativa falhada
    print("SISTEMA BLOQUEADO. Demasiadas tentativas falhadas.")
    print(f"Tempo de espera: {espera} segundos ({espera // 60} minuto(s)).")
```

### Notas pedagógicas

- O ponto mais comum de confusão é o `tentativas + 1` no `input()` — o contador ainda não foi incrementado nesse ponto, por isso temos de somar 1 para mostrar o número correto.
- O `else` do `while` é o mecanismo elegante para distinguir "saiu com `break`" de "esgotou as tentativas". Muitos alunos tentam usar um `if tentativas == 3` depois do ciclo — funciona, mas é menos idiomático.
- Variação aceitável: usar `pin = "4821"` como constante no topo do programa em vez de hardcoded dentro do `if`.

---

## Ficha A ★ — Ciclo de Boas-vindas

### Solução base

```python
nome = input("O teu nome: ")

while True:
    print("\n=== MENU ===")
    print("1 - Boas-vindas")
    print("2 - Info do sistema")
    print("3 - Sair")
    
    opcao = input("Escolha: ")
    
    if opcao == "1":
        print(f"Olá, {nome}! Bem-vindo ao sistema.")
    elif opcao == "2":
        print("Sistema: UC00606 · Python 3 · ETPS · 2025/2026")
    elif opcao == "3":
        print(f"Até logo, {nome}!")
        break
    else:
        print("Opção inválida. Escolhe 1, 2 ou 3.")
```

### Solução com desafio extra (+10 XP)

```python
nome = input("O teu nome: ")
usos = 0

while True:
    print("\n=== MENU ===")
    print("1 - Boas-vindas")
    print("2 - Info do sistema")
    print("3 - Sair")
    
    opcao = input("Escolha: ")
    usos += 1
    
    if opcao == "1":
        print(f"Olá, {nome}! Bem-vindo ao sistema.")
    elif opcao == "2":
        print("Sistema: UC00606 · Python 3 · ETPS · 2025/2026")
    elif opcao == "3":
        print(f"Até logo, {nome}!")
        print(f"Usaste o menu {usos} vez(es).")
        break
    else:
        print("Opção inválida. Escolhe 1, 2 ou 3.")
```

### Resposta à pergunta de reflexão

> *O que aconteceria se retirasses o `break` da opção 3?*

O programa continuaria a mostrar o menu indefinidamente — o utilizador nunca conseguiria sair. A mensagem "Até logo" seria impressa, mas o ciclo voltaria ao início. O `break` é o único mecanismo que interrompe um `while True`.

### Notas pedagógicas

- Alguns alunos podem tentar usar `while opcao != "3":` em vez de `while True`. É válido, mas obriga a inicializar `opcao = ""` antes do ciclo. Vale a pena discutir as duas abordagens.
- O incremento do contador (`usos += 1`) deve ficar **antes** dos `if/elif` — assim conta também as opções inválidas. Se o aluno colocar dentro de cada ramo, não conta as entradas inválidas. Ambas as versões são defensáveis — depende do que se quer contar.

---

## Ficha C ★★★ — Força Bruta Simulada

### Solução base

```python
# Validar o PIN alvo
pin_alvo = ""
while not (pin_alvo.isdigit() and len(pin_alvo) == 4):
    pin_alvo = input("PIN alvo (4 dígitos): ")
    if not (pin_alvo.isdigit() and len(pin_alvo) == 4):
        print("PIN inválido. Tem de ter exatamente 4 dígitos numéricos.")

print("\nIniciando simulação de força bruta...")

tentativas = 0
encontrado = False

while tentativas <= 9999:
    pin_teste = str(tentativas).zfill(4)
    
    if tentativas % 1000 == 0:
        print(f"Testadas {tentativas} combinações...")
    
    if pin_teste == pin_alvo:
        encontrado = True
        break
    
    tentativas += 1

# Resultados
total_possivel = 10000
percentagem = (tentativas / total_possivel) * 100

print(f"\nPIN encontrado: {pin_teste}")
print(f"Tentativas necessárias: {tentativas + 1}")
print(f"Percentagem do total: {percentagem:.2f}%")
print(f"No pior caso seriam necessárias {total_possivel} tentativas.")
```

### Resposta à questão de análise (+20 XP)

> *Se o sistema bloqueasse após 3 tentativas e obrigasse a esperar 30 segundos, quanto tempo demoraria o pior caso?*

```python
# Cálculo do pior caso com bloqueio
total_pinos = 10000
tentativas_por_bloco = 3
espera_por_bloco = 30  # segundos

blocos = total_pinos // tentativas_por_bloco          # 3333 blocos
tempo_total_segundos = blocos * espera_por_bloco       # 99 990 segundos
tempo_minutos = tempo_total_segundos // 60             # 1666 minutos
tempo_horas = tempo_minutos // 60                      # 27 horas

print(f"Blocos de 3 tentativas: {blocos}")
print(f"Tempo total: {tempo_total_segundos} segundos")
print(f"           = {tempo_minutos} minutos")
print(f"           = {tempo_horas} horas")
# → ~27 horas no pior caso
```

**Resposta esperada:** com bloqueio de 30 segundos a cada 3 tentativas, o pior caso é aproximadamente **27 horas**. Na prática, sistemas reais aumentam o tempo exponencialmente (ex: 30s, 60s, 5 min, 30 min...) — o que torna a força bruta completamente impraticável.

### Resposta à reflexão final

Respostas aceitáveis incluem:
- PIN de 4 dígitos tem apenas 10 000 combinações — muito pouco
- Melhorias: aumentar para 6+ dígitos, bloquear após N tentativas, usar tempo de espera crescente, alertar o utilizador, registar tentativas num log

### Notas pedagógicas

- O `str(tentativas).zfill(4)` é novo para a maioria — vale a pena mostrar no quadro antes de a ficha começar ou dar como dica.
- Atenção ao `tentativas + 1` nos resultados: o contador começa em 0, por isso "0042" é encontrado na 43.ª tentativa (índice 42 + 1).
- Alunos mais avançados podem tentar usar `range()` e um `for` — tecnicamente funciona, mas o objetivo é praticar `while`. Aceitar, mas pedir que façam também com `while`.

---

## Ficha Extra — Desafios Adicionais

### Ex 1 — Adivinhar o Número (+70 XP)

```python
numero_secreto = 42
tentativas = 0
max_tentativas = 10

print("Adivinhas o número entre 1 e 100?")

while tentativas < max_tentativas:
    tentativas += 1
    chute = int(input(f"Tentativa {tentativas}/{max_tentativas}: "))
    
    if chute == numero_secreto:
        print(f"Acertaste! O número era {numero_secreto}.")
        print(f"Conseguiste em {tentativas} tentativa(s).")
        break
    elif chute < numero_secreto:
        print("Muito baixo!")
    else:
        print("Muito alto!")
else:
    print(f"Esgotaste as tentativas. O número era {numero_secreto}.")
```

### Ex 2 — Validador de Password Forte (+50 XP)

```python
password = ""
while True:
    password = input("Introduz uma password forte: ")
    
    tem_8_chars = len(password) >= 8
    tem_numero = any(c.isdigit() for c in password)
    nao_toda_minuscula = password != password.lower()
    
    if tem_8_chars and tem_numero and nao_toda_minuscula:
        print("Password aceite! É forte o suficiente.")
        break
    else:
        print("Password fraca. Requisitos:")
        if not tem_8_chars:
            print("  - Mínimo 8 caracteres")
        if not tem_numero:
            print("  - Pelo menos um número")
        if not nao_toda_minuscula:
            print("  - Pelo menos uma letra maiúscula")
```

### Ex 3 — Calculadora com Menu (+40 XP)

```python
while True:
    print("\n=== CALCULADORA ===")
    print("1 - Somar")
    print("2 - Subtrair")
    print("3 - Multiplicar")
    print("4 - Dividir")
    print("5 - Sair")
    
    opcao = input("Escolha: ")
    
    if opcao == "5":
        print("Até logo!")
        break
    
    if opcao in ("1", "2", "3", "4"):
        a = float(input("Primeiro número: "))
        b = float(input("Segundo número: "))
        
        if opcao == "1":
            print(f"Resultado: {a + b}")
        elif opcao == "2":
            print(f"Resultado: {a - b}")
        elif opcao == "3":
            print(f"Resultado: {a * b}")
        elif opcao == "4":
            if b == 0:
                print("Erro: não é possível dividir por zero.")
            else:
                print(f"Resultado: {a / b}")
    else:
        print("Opção inválida.")
```

### Ex 4 — Contador de Vogais (+30 XP)

```python
frase = ""
while len(frase.split()) < 5:
    frase = input("Escreve uma frase com pelo menos 5 palavras: ")
    if len(frase.split()) < 5:
        print(f"A frase tem {len(frase.split())} palavra(s). Precisa de pelo menos 5.")

vogais = "aeiouAEIOU"
contador = 0
for letra in frase:
    if letra in vogais:
        contador += 1

print(f"A frase tem {contador} vogal(is).")
```

### Ex 5 — Missão v0.3+ Completa (+50 XP)

```python
print("=" * 50)
print("  SISTEMA DE CONTROLO — CyberBase Alpha v0.3+")
print("=" * 50)

nome  = input("Identificação: ")
nivel = input("Nível (admin/user/guest): ")

tentativas = 0
max_tentativas = 3

while tentativas < max_tentativas:
    restam = max_tentativas - tentativas
    pw = input(f"Password ({restam} tentativa(s) restante(s)): ")
    
    if pw == "cyber2025":
        if tentativas == 0:
            print(f"\nBónus: acesso expresso!")
        print(f"\nBem-vindo, {nome}. Acesso {nivel} concedido.")
        break
    
    tentativas += 1
    if tentativas < max_tentativas:
        print(f"Password incorreta.")
else:
    print(f"\n{nome}, o teu acesso foi bloqueado.")
    print("Acesso bloqueado por 60 segundos.")
```

---

<sub>UC00606 · Linguagem Estruturada · ETPS · 2025/2026 · Resolução Aula 3 — uso interno</sub>
