require './lib/book'
require './lib/author'

RSpec.describe Author do
  it 'exists' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                   last_name: "Bronte"})

    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it 'has attributes' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                   last_name: "Bronte"})

    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it 'it can write books' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                   last_name: "Bronte"})

    expect(charlotte_bronte.books).to eq([])

    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    expect(jane_eyre.title).to eq("Jane Eyre")
    expect(jane_eyre.publication_date).to eq("October 16, 1847")
  end

  it 'can publish books' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                   last_name: "Bronte"})

    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")

    expect(charlotte_bronte.books).to eq([])

    charlotte_bronte.publish(jane_eyre)
    expect(charlotte_bronte.books).to eq([jane_eyre])

    charlotte_bronte.publish(villette)
    expect(charlotte_bronte.books).to eq([jane_eyre, villette])
  end
end
