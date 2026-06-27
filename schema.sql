-- ============================================================
--  SCHÉMA SUPABASE — Rappels App
--  Collez ce SQL dans l'éditeur SQL de Supabase
-- ============================================================

-- 1. Créer la table
CREATE TABLE IF NOT EXISTS reminders (
  id          BIGSERIAL PRIMARY KEY,
  title       TEXT        NOT NULL,
  cat         TEXT        NOT NULL DEFAULT 'perso'
                CHECK (cat IN ('perso','travail','sante','autre')),
  prio        TEXT        NOT NULL DEFAULT 'normale'
                CHECK (prio IN ('haute','normale','basse')),
  time        TIMESTAMPTZ NOT NULL,
  done        BOOLEAN     NOT NULL DEFAULT FALSE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 2. Activer la sécurité par ligne (RLS)
ALTER TABLE reminders ENABLE ROW LEVEL SECURITY;

-- 3. Politique : accès public (clé anon)
--    Pour un usage personnel simple. Pour multi-utilisateurs, voir README.
CREATE POLICY "Accès public lecture"
  ON reminders FOR SELECT USING (true);

CREATE POLICY "Accès public insertion"
  ON reminders FOR INSERT WITH CHECK (true);

CREATE POLICY "Accès public mise à jour"
  ON reminders FOR UPDATE USING (true);

CREATE POLICY "Accès public suppression"
  ON reminders FOR DELETE USING (true);

-- 4. Activer la réplication temps réel
ALTER PUBLICATION supabase_realtime ADD TABLE reminders;

-- 5. Index pour les performances
CREATE INDEX IF NOT EXISTS idx_reminders_done ON reminders(done);
CREATE INDEX IF NOT EXISTS idx_reminders_time ON reminders(time);
CREATE INDEX IF NOT EXISTS idx_reminders_prio ON reminders(prio);
