if ENV['BONSAI_INDEX_URL']
  Tire.configure do
    url "http://index.bonsai.io"
  end
  BONSAI_INDEX_NAME = ENV['BONSAI_INDEX_URL'][/[^\/]+$/]
end
