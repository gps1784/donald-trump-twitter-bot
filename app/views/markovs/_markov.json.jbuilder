json.extract! markov, :id, :current, :next, :frequency, :recent, :anger, :fear, :joy, :sadness, :analytical, :confident, :tentative, :created_at, :updated_at
json.url markov_url(markov, format: :json)
