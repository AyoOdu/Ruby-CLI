# Robot App

Moving Robot - Ruby application.

## 🧰 Requirements

- **Ruby 3.4.4 or later**
- [Bundler](https://bundler.io/) for dependency management

## 🚀 Setup

1. **Install dependencies**

```bash
bundle install
```

2. **Set up environment**
```bash
# .env
LOGGER_ON=true # Turns on app logger
```

3. **Test & Linting**

```bash
bundle exec rspec

bundle exec rubocop
```

4. **Run application**

```bash
ruby app.rb
```

5. **Project structure**

<pre>
.
├── Gemfile
├── Gemfile.lock
├── ReadMe.md
├── app.rb
├── lib
│   ├── app_logger.rb
│   └── robot.rb
├── spec
│   ├── app_spec.rb
│   ├── robot_spec.rb
│   └── spec_helper.rb
└── tmp
    └── app.log
</pre>

6. **Notes**

### View notes logged in tmp file

```
I, [2025-07-10T20:38:40.908383 #94043]  INFO -- : Placed PLACE 1,2,N
I, [2025-07-10T20:38:40.913023 #94043]  INFO -- : Action MOVE completed
I, [2025-07-10T20:38:40.917637 #94043]  INFO -- : Action LEFT completed
I, [2025-07-10T20:38:40.922379 #94043]  INFO -- : Action RIGHT completed
I, [2025-07-10T20:38:40.927216 #94043]  INFO -- : Action REPORT completed
E, [2025-07-10T20:38:40.930571 #94043] ERROR -- : Invalid JUMP sent
I, [2025-07-10T20:38:40.935210 #94043]  INFO -- : Placed PLACE 0,0,E
I, [2025-07-10T20:38:40.935650 #94043]  INFO -- : Action MOVE completed
I, [2025-07-10T20:38:40.936001 #94043]  INFO -- : Action LEFT completed
I, [2025-07-10T20:38:40.936314 #94043]  INFO -- : Action REPORT completed
E, [2025-07-10T20:38:40.936561 #94043] ERROR -- : Invalid DANCE sent
```