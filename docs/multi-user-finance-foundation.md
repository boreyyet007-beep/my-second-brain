# Multi-user finance app foundation

## Goal
Build a finance tracker where each user has a separate data store, file storage, and receipt history, without cross-user leakage.

## Recommended stack
- Frontend: HTML/JS or React
- Auth: Supabase Auth
- Database: Supabase Postgres
- Storage: Supabase Storage
- AI OCR: OpenAI Vision / Gemini / Azure Vision in a backend function

## Core rules
1. Every table must include `user_id`.
2. Every query must be filtered by the logged-in user.
3. Files must be saved under a user-specific storage path.
4. AI keys must live only in the backend environment.
5. Browser localStorage can be used only as temporary cache, not as the source of truth.

## User flow
1. User signs up or logs in.
2. User begins with their own monthly records.
3. User uploads receipts or bank statements.
4. Frontend sends the image to the AI OCR endpoint.
5. AI extracts merchant, amount, date, and notes.
6. Data is saved to Supabase under the current user.
7. UI displays only records for that user.

## Database design
- `profiles` — user profile data
- `categories` — user-defined categories by transaction type
- `transactions` — all income and expense entries
- `receipts` — uploaded receipt evidence

## Security model
Use Supabase Row Level Security (RLS) and enforce ownership checks with `auth.uid()`.

Example rule:
- `WHERE user_id = auth.uid()`

This is the key rule preventing users from reading each other's data.

## AI OCR flow
Frontend -> backend API -> AI service -> parsed JSON -> save into database -> save file into storage bucket

Output should include:
- merchant name
- phone number
- date
- amount
- category
- notes

## Storage structure
`users/{user_id}/receipts/...`
`users/{user_id}/bank-slips/...`

## Next steps
- Run `supabase/schema.sql`
- Run `supabase/rls.sql`
- Create auth UI in frontend
- Create OCR endpoint
- Add sync + offline fallback

## Notes
This repository still contains a browser-only finance demo, but the foundation here is the first step toward a true multi-user app with secure data isolation.
