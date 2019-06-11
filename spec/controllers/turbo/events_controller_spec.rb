require 'rails_helper'

describe Turbo::EventsController do
  render_views

  describe 'GET index' do
    let!(:event) { FactoryBot.create(:event, :published) }

    before do
      FactoryBot.create(:event)
      get :index, format: :rss
    end

    # it { expect(assigns(:events)).to eq Event.all }
    it { expect(response).to be_ok }
    it { expect(response.content_type).to eq 'application/rss+xml' }
    it { expect(Nokogiri::XML(response.body).css('channel item').count).to eq 1 }
  end
end
