# my-second-brain

My first repository on GitHub.

## Multi-user finance app foundation

This repository now includes a foundation for a multi-user finance app that keeps each user's data isolated and private.

### Included foundation
- Supabase schema for users, profiles, categories, transactions, receipts
- Row Level Security (RLS) policies for user-only access
- database trigger to create a profile when a user signs up
- environment template for frontend/backend configuration
- architecture documentation for the app roadmap

### Files
- `supabase/schema.sql` — database tables, enums, trigger
- `supabase/rls.sql` — user-only access policies
- `.env.example` — environment variables for Supabase and AI OCR
- `docs/multi-user-finance-foundation.md` — architecture and flow overview

### Next implementation steps
1. Create a Supabase project and run the SQL files
2. Configure auth and storage
3. Build the frontend login/dashboard UI
4. Add AI receipt OCR backend endpoint
5. Sync browser cache with Supabase when online

### Important security note
API keys must stay on the backend/server. Never expose them in the browser app or `index.html`.
