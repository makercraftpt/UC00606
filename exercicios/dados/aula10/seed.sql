-- UC00606 · Aula 10 · Dados de exemplo para SQLite
-- Executar: python -c "import sqlite3; conn=sqlite3.connect('agentes.db'); conn.executescript(open('seed.sql').read()); conn.close()"

CREATE TABLE IF NOT EXISTS agentes (
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    codename TEXT    NOT NULL UNIQUE,
    nivel    INTEGER NOT NULL DEFAULT 1,
    ativo    INTEGER NOT NULL DEFAULT 1
);

INSERT OR IGNORE INTO agentes (codename, nivel, ativo) VALUES
    ('FALCON', 3, 1),
    ('VIPER',  5, 0),
    ('GHOST',  2, 1),
    ('LYNX',   4, 1),
    ('COBRA',  1, 0),
    ('RAVEN',  3, 1),
    ('WOLF',   5, 1);
