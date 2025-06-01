CREATE TABLE IF NOT EXISTS public.countries (
        id TEXT PRIMARY KEY,
        country TEXT NOT NULL,
        nationality TEXT NOT NULL,
        code TEXT NOT NULL
    );

CREATE TABLE IF NOT EXISTS public.users (
        id TEXT PRIMARY KEY,
        username TEXT NOT NULL UNIQUE,
        first_name TEXT,
        last_name TEXT,
        password TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        gender TEXT CHECK(gender IN ('Male', 'Female')),
        country_id TEXT,
        birthday DATE,
        created DATE,
        FOREIGN KEY (country_id) REFERENCES public.countries(id)
    );

CREATE TABLE IF NOT EXISTS public.companies (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        tax_id NUMERIC,
        sales NUMERIC
    );

CREATE TABLE IF NOT EXISTS public.products (
        id TEXT PRIMARY KEY,
        product_name TEXT NOT NULL,
        description TEXT,
        price DECIMAL(10,2) NOT NULL,
        department TEXT,
        release DATE,
        updated_at TIMESTAMP
    );

CREATE TABLE IF NOT EXISTS public.product_items (
        id TEXT PRIMARY KEY,
        product_id TEXT NOT NULL,
        serial_number TEXT UNIQUE,
        status TEXT CHECK(status IN ('available', 'sold', 'returned')),
        FOREIGN KEY (product_id) REFERENCES public.products(id)
    );

CREATE TABLE IF NOT EXISTS public.payment_methods (
        id TEXT PRIMARY KEY,
        payment_methods TEXT CHECK(payment_methods IN ('Paypal', 'Binance', 'Zinly', 'Zeller', 'American Express', 'Master Card', 'Visa', 'Bank of America'))
    );

CREATE TABLE IF NOT EXISTS public.bills (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        bill_address TEXT NOT NULL,
        shipping_address TEXT NOT NULL,
        status TEXT CHECK(status IN ('pending', 'paid', 'shipped', 'delivered', 'cancelled')),
        created DATE,
        FOREIGN KEY (user_id) REFERENCES public.users(id)
    );

CREATE TABLE IF NOT EXISTS public.payments (
        id TEXT PRIMARY KEY,
        bills_id TEXT NOT NULL,
        payment_methods_id TEXT NOT NULL,
        transaction_id TEXT,
        status TEXT CHECK(status IN ('pending', 'completed', 'failed', 'refunded')),
        created DATE,
        FOREIGN KEY (bills_id) REFERENCES public.bills(id),
        FOREIGN KEY (payment_methods_id) REFERENCES public.payment_methods(id)
    );

CREATE TABLE IF NOT EXISTS public.bill_items (
        id TEXT PRIMARY KEY,
        bill_id TEXT NOT NULL,
        product_item_id TEXT NOT NULL,
        quantity INTEGER NOT NULL DEFAULT 1,
        FOREIGN KEY (bill_id) REFERENCES public.bills(id),
        FOREIGN KEY (product_item_id) REFERENCES public.product_items(id)
    );