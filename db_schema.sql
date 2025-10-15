-- db_schema.sql
CREATE TABLE IF NOT EXISTS users (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  kyc_status TEXT DEFAULT 'not_submitted',
  kyc_data JSONB,
  is_admin BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS live_accounts (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT REFERENCES users(id),
  balance NUMERIC,
  realized_profit NUMERIC DEFAULT 0,
  split_trader INT DEFAULT 70,
  split_prop INT DEFAULT 30,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS trades (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT REFERENCES users(id),
  live_account_id BIGINT REFERENCES live_accounts(id),
  symbol TEXT,
  lots NUMERIC,
  profit NUMERIC,
  commission NUMERIC,
  time TIMESTAMP DEFAULT now(),
  raw JSONB
);

CREATE TABLE IF NOT EXISTS commission_ledger (
  id BIGSERIAL PRIMARY KEY,
  trade_id BIGINT REFERENCES trades(id),
  user_id BIGINT REFERENCES users(id),
  amount NUMERIC,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS withdraws (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT REFERENCES users(id),
  live_account_id BIGINT REFERENCES live_accounts(id),
  amount NUMERIC,
  status TEXT DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT now(),
  processed_at TIMESTAMP
);
