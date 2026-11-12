# VOLT.CO

VOLT.CO is an online electricals and electronics store: a full online shop with its own admin panel, built from the same
tested base as Shop.co and fitted to this kind of business.

## Run it on this PC

Start XAMPP's MySQL, then in two terminals in this folder:

```
npm run api      (the shop's server, port 8106)
npm run build    (first time, and after any change)
npm run start    (the shop itself, port 3106)
```

- Shop: http://voltco.localhost:3106
- Admin: http://voltco.localhost:3106/admin (the same sign-in as the live Shop.co demo)

Use the `voltco.localhost` address, not plain `localhost`: each store keeps its own sign-in that way.

## What makes it this shop

Everything that differs from one kind of shop to another is in one file,
`backend/config/shop.json`: the name, colours, the two product options
("Model" and "Colour"), the "Brand" filter, the
wording, and which extras are on (warranty, heavy-item delivery, age confirmation).

- Demo products, categories, banners, promo codes and delivery zones: `backend/seeds/demo/catalog.json`
  with pictures in `backend/seeds/demo/pictures/` (credits in `CREDITS.md` there).
- Database: `voltco_demo` (its own, shared with no other store).
- Settings for this PC: `backend/.env` and `.env.local` (not in git).

## For a real client

1. Change the name, colours and wording in `backend/config/shop.json`.
2. Replace the demo catalogue with the client's products (in the admin, or in `catalog.json`
   before the first `php backend/seeds/seed.php`).
3. Put the client's own payment keys, email settings and address in `backend/.env`.
4. Host it by following `deploy/cpanel/README.md`.

## Checks

```
TEST_DB_DATABASE=voltco_test TEST_API_PORT=8196 TEST_REVALIDATE_PORT=8296 TEST_SHOP_API_PORT=8396 php backend/tests/run.php
npm run test:web
npx tsc --noEmit -p .
npm run lint
```
