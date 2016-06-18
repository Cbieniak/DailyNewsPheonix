ExUnit.start

Mix.Task.run "ecto.create", ~w(-r DailyNews.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r DailyNews.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(DailyNews.Repo)

