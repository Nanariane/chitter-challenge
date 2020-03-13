# feature 'pg'

feature 'Viewing peeps' do

  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature 'Viewing peeps' do
  scenario 'Visiting /peeps shows all the peeps' do
# Change cette partie parce qu'on a une meilleure facon d'inserer des datas
    # connection = PG.connect(dbname: 'chitter_test')
    #
    # connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")
    # connection.exec("INSERT INTO peeps VALUES(2, 'I saw a fox!');")
    Peep.post(message: 'This is a peep!')
    Peep.post(message: 'I saw a fox!')

    visit ('/peeps')

    expect(page).to have_content 'This is a peep!'
    expect(page).to have_content 'I saw a fox!'
  end
end
