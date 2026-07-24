# Music Department Website

## Overview
This is a Rails-based website for a school music program. It provides a public-facing hub for schedules, program information, documents, contact details, fundraising links, galleries, and admin-managed content.

## Features
- Program and school landing pages
- Shared hero sections with page-specific image overrides
- Embedded calendars and document links
- PDF uploads for program-specific resources
- Admin editing through Administrate
- Authenticated admin access through Devise
- Contact form protection with Invisible Captcha
- Active Storage uploads backed by Amazon S3 in production

## Stack
- Rails 7.0.x
- Ruby 3.2.8
- PostgreSQL
- Tailwind CSS
- Turbo and Stimulus
- Importmap for JavaScript
- Simple Form
- Administrate
- Devise
- aws-sdk-s3

## Local Setup
1. Install Ruby 3.2.8 and PostgreSQL.
2. Install dependencies with `bundle install`.
3. Set up your database configuration in `config/database.yml` or via `DATABASE_URL`.
4. Run the initial setup:

```bash
bin/rails db:create db:migrate db:seed
```

5. Start the app in development:

```bash
./bin/dev
```

`bin/dev` runs the Rails server and Tailwind watcher together.

## Production Deployment
This app can be deployed to any Rails-capable host that supports PostgreSQL, background file storage, and environment variables. Hatchbox, Render, Fly.io, Heroku, and similar platforms should all work with the same basic setup.

Before deploying, make sure the following are configured:

- `RAILS_MASTER_KEY` or `config/master.key`
- Database credentials or `DATABASE_URL`
- Amazon S3 credentials for Active Storage
- Optional Stripe values if donations are enabled
- Mailer SMTP settings if email delivery is used in production
- `RAILS_LOG_TO_STDOUT=1`
- `RAILS_SERVE_STATIC_FILES=1` if your host expects Rails to serve public assets

Recommended deploy steps:

```bash
bin/rails assets:precompile
bin/rails db:migrate
```

If your host builds from scratch, run bundle install, precompile assets, and migrate the database as part of the release process.

## Required Credentials and Environment Variables
This application reads some settings from Rails credentials or environment variables:

- AWS S3: `aws.access_key_id`, `aws.secret_access_key`
- Stripe: `STRIPE_PK`, `STRIPE_PID`, `STRIPE_BID` or the matching Rails credentials entries
- Rails master key: `RAILS_MASTER_KEY`
- Database: `DATABASE_URL` or the values in `config/database.yml`

## Notes
- Production Active Storage is configured to use S3.
- Images entered as bare filenames should point to files in `app/assets/images`.
- The admin area is designed for site operators to manage pages, programs, schools, galleries, and PDFs without editing code.