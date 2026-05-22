# Como atualizar o repositório semana a semana

> Guia rápido para o professor — só para referência interna.

---

## Estrutura de ficheiros

```
UC00606/
├── README.md                  ← página principal (atualiza a tabela de semanas)
├── _config.yml                ← configuração do GitHub Pages (não tocar)
├── semanas/
│   ├── semana01.md            ← já criado
│   ├── semana02.md            ← criar antes da Aula 2
│   └── ...
├── referencias/
│   ├── variaveis.md           ← já criado
│   ├── input_output.md        ← já criado
│   ├── selecao.md             ← criar antes da Semana 2
│   ├── ciclos.md              ← criar antes da Semana 3
│   ├── funcoes.md             ← criar antes da Semana 5
│   ├── strings.md             ← criar antes da Semana 6
│   └── erros.md               ← criar antes da Semana 7
└── exercicios/
    ├── aula1.md               ← já criado
    └── aula2.md               ← criar antes da Aula 2
```

---

## Fluxo semanal

1. **Antes da aula:** criar `semanas/semanaXX.md` e `exercicios/aulaXX.md`
2. **Atualizar `README.md`:** mudar o estado da semana de `🔒 Em breve` para `✅ Disponível`
3. **Fazer commit e push** para o GitHub
4. Os alunos veem automaticamente na página do GitHub Pages

---

## Ativar GitHub Pages (primeira vez)

1. Ir ao repositório no GitHub → **Settings**
2. Secção **Pages** (menu lateral)
3. Source: `Deploy from a branch`
4. Branch: `main` · Folder: `/ (root)`
5. Guardar — o site fica disponível em `https://SEU-USERNAME.github.io/UC00606/`

---

## Template para nova semana

Copia e adapta o ficheiro `semanas/semana01.md`:

```markdown
# 📅 Semana X — [Título]

> **UC00606 · Linguagem Estruturada · Aula X**  
> Tema: [temas desta semana]

## 🎯 O que aprendemos esta semana
...

## ⚡ Resumo rápido
...

## 🧩 Exercícios desta semana
...

## 🐞 Erros comuns
...

## 🔗 Referências úteis
...
```
