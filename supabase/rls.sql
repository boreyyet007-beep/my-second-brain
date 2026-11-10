-- 1) Enable RLS
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.receipts ENABLE ROW LEVEL SECURITY;

-- 2) Profiles policies
CREATE POLICY "Users can view their own profile"
ON public.profiles
FOR SELECT
USING (auth.uid() = id);

CREATE POLICY "Users can update their own profile"
ON public.profiles
FOR UPDATE
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);

-- 3) Categories policies
CREATE POLICY "Users can view their own categories"
ON public.categories
FOR SELECT
USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own categories"
ON public.categories
FOR INSERT
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own categories"
ON public.categories
FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete their own categories"
ON public.categories
FOR DELETE
USING (auth.uid() = user_id);

-- 4) Transactions policies
CREATE POLICY "Users can view their own transactions"
ON public.transactions
FOR SELECT
USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own transactions"
ON public.transactions
FOR INSERT
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own transactions"
ON public.transactions
FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete their own transactions"
ON public.transactions
FOR DELETE
USING (auth.uid() = user_id);

-- 5) Receipts policies
CREATE POLICY "Users can view their own receipts"
ON public.receipts
FOR SELECT
USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own receipts"
ON public.receipts
FOR INSERT
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own receipts"
ON public.receipts
FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete their own receipts"
ON public.receipts
FOR DELETE
USING (auth.uid() = user_id);

-- 6) Storage policies (example for Supabase Storage)
-- Create a bucket named 'user-uploads' first in Supabase Storage.
-- Then apply policies like:
--
-- create policy "Users can view their own files"
-- on storage.objects for select
-- using (bucket_id = 'user-uploads' and auth.uid()::text = (storage.foldername(name))[1]);
--
-- create policy "Users can upload their own files"
-- on storage.objects for insert
-- with check (bucket_id = 'user-uploads' and auth.uid()::text = (storage.foldername(name))[1]);
--
-- create policy "Users can update their own files"
-- on storage.objects for update
-- using (bucket_id = 'user-uploads' and auth.uid()::text = (storage.foldername(name))[1]);
--
-- create policy "Users can delete their own files"
-- on storage.objects for delete
-- using (bucket_id = 'user-uploads' and auth.uid()::text = (storage.foldername(name))[1]);
