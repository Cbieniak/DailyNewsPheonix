alias DailyNews.Repo
alias DailyNews.NewsItem
alias DailyNews.Source

[
  %NewsItem{
    url: "https://medium.com/browse/b3ee72d38ca4"
  },
  %NewsItem{
    url: "http://www.theage.com.au/victoria"
  },
  %NewsItem{
    url: "http://hn.premii.com/#"
  }
] |> Enum.each(&Repo.insert!(&1))

[
  %Source{
    name: "dota2"
  },
  %Source{
    name: "hearthstone"
  },
  %Source{
    name: "apple"
  }
] |> Enum.each(&Repo.insert!(&1))


