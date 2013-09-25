# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

share_examples_for 'found items' do
  context 'code' do
    it { expect(res_genre.code).to eq 200 }
  end
  context 'size' do
    it { expect(res_genre["ResultSet"]["totalResultsReturned"].to_i).to be > 0 }
  end
end

share_examples_for 'not found items' do
  context 'code' do
    it { expect(res_genre.code).to eq 200 }
  end
  context 'size' do
    it { expect(res_genre["ResultSet"]["totalResultsReturned"].to_i).to eq 0 }
  end
end

share_examples_for 'found items by genre' do
  context 'code' do
    it { expect(res_genre.code).to eq 200 }
  end
  context 'size' do
    it { expect(res_genre["ResultSet"]["totalResultsReturned"].to_i).to be > 0 }
  end
end

share_examples_for 'not found items by genre' do
  context 'code' do
    it { expect(res_genre.code).to eq 200 }
  end
  context 'size' do
    it { expect(res_genre["ResultSet"]["totalResultsReturned"].to_i).to eq 0 }
  end
end

share_examples_for 'found items by keyword' do
  context 'code' do
    it { expect(res_keyword.code).to eq 200 }
  end
  context 'size' do
    it { expect(res_keyword["ResultSet"]["totalResultsReturned"].to_i).to be > 0 }
  end
end

share_examples_for 'not found items by keyword' do
  context 'code' do
    it { expect(res_keyword.code).to eq 200 }
  end
  context 'size' do
    it { expect(res_keyword["ResultSet"]["totalResultsReturned"].to_i).to eq 0 }
  end
end


share_examples_for 'bad request' do
  context 'code' do
    it { expect(res_error.code).to eq 400 }
  end
  context 'message' do
    it { expect(res_error.message).to eq 'Bad Request' }
  end
end

describe "Yahoo::Api::Shopping.review_search" do

  let(:res_genre) {
    VCR.use_cassette('shopping_review_search_' + category_id.to_s) do
      Yahoo::Api::Shopping.review_search({:category_id => category_id})
    end
  }

  let(:res_error) {
    VCR.use_cassette('shopping_review_search') do
      Yahoo::Api::Shopping.review_search({})
    end
  }

  context 'found items by genre' do
    let(:category_id) { '13457' }
    it_should_behave_like 'found items by genre'
  end

  context 'bad request' do
    it_should_behave_like 'bad request'
  end

end

describe "Yahoo::Api::Shopping.event_search" do

  let(:res_genre) {
    VCR.use_cassette('shopping_event_search_' + event_type.to_s) do
      Yahoo::Api::Shopping.event_search({:event_type => event_type})
    end
  }

  let(:res_error) {
    VCR.use_cassette('shopping_event_search') do
      Yahoo::Api::Shopping.event_search({})
    end
  }

  context 'found items' do
    let(:event_type) { 'store' }
    it_should_behave_like 'found items'
  end

end

describe "Yahoo::Api::Shopping.get_module" do

  let(:res_genre) {
    VCR.use_cassette('shopping_get_module_' + category_id.to_s+ '_'+ position.to_s) do
      Yahoo::Api::Shopping.get_module({:category_id => category_id,:position => position})
    end
  }

  let(:res_error) {
    VCR.use_cassette('shopping_get_module') do
      Yahoo::Api::Shopping.get_module({})
    end
  }

  context 'found items by genre' do
    let(:category_id) { '13457' }
    let(:position) { 'eventrecommend' }
    it_should_behave_like 'found items by genre'
  end

  context 'bad request' do
    it_should_behave_like 'bad request'
  end

end

describe "Yahoo::Api::Shopping.content_match_ranking" do

  let(:res_genre) {
    VCR.use_cassette('shopping_content_match_ranking' + url.to_s) do
      Yahoo::Api::Shopping.content_match_item({:url => url})
    end
  }

  let(:res_error) {
    VCR.use_cassette('shopping_content_match_ranking') do
      Yahoo::Api::Shopping.content_match_item({})
    end
  }

  context 'found items' do
    let(:url) { URI.encode('http://www.yahoo.co.jp/') }
    it_should_behave_like 'found items'
  end

  context 'bad request' do
    it_should_behave_like 'bad request'
  end

end

describe "Yahoo::Api::Shopping.content_match_item" do

  let(:res_genre) {
    VCR.use_cassette('shopping_content_match_item_' + url.to_s) do
      Yahoo::Api::Shopping.content_match_item({:url => url})
    end
  }

  let(:res_error) {
    VCR.use_cassette('shopping_content_match_item') do
      Yahoo::Api::Shopping.content_match_item({})
    end
  }

  context 'found items' do
    let(:url) { URI.encode('http://www.yahoo.co.jp/') }
    it_should_behave_like 'found items'
  end

  context 'bad request' do
    it_should_behave_like 'bad request'
  end

end

describe "Yahoo::Api::Shopping.query_ranking" do

  let(:res_genre) {
    VCR.use_cassette('shopping_query_ranking_' + category_id.to_s) do
      Yahoo::Api::Shopping.query_ranking({:category_id => category_id})
    end
  }

  context 'found items by genre' do
    let(:category_id) { '13457' }
    it_should_behave_like 'found items by genre'
  end

  context 'not found items by genre' do
    let(:category_id) { '399811111' }
    it_should_behave_like 'not found items by genre'
  end

end

describe "Yahoo::Api::Shopping.item_lookup" do

  let(:res_genre) {
    VCR.use_cassette('shopping_item_lookup_' + itemcode.to_s) do
      Yahoo::Api::Shopping.item_lookup({:itemcode => itemcode})
    end
  }

  let(:res_error) {
    VCR.use_cassette('shopping_item_lookup') do
      Yahoo::Api::Shopping.item_lookup({})
    end
  }

  context 'found items by genre' do
    let(:itemcode) { 'hair_haclm352nn' }
    it_should_behave_like 'found items by genre'
  end

  context 'not found items by genre' do
    let(:itemcode) { 'eshopping_113cd02221164' }
    it_should_behave_like 'not found items by genre'
  end

  context 'bad request' do
    it_should_behave_like 'bad request'
  end

end

describe "Yahoo::Api::Shopping.category_search" do

  let(:res_genre) {
    VCR.use_cassette('shopping_category_search_' + category_id.to_s) do
      Yahoo::Api::Shopping.category_search({:category_id => category_id})
    end
  }

  let(:res_error) {
    VCR.use_cassette('shopping_category_search') do
      Yahoo::Api::Shopping.category_search({})
    end
  }

  context 'found items by genre' do
    let(:category_id) { '1' }
    it_should_behave_like 'found items by genre'
  end

  context 'bad request' do
    it_should_behave_like 'bad request'
  end

end

describe "Yahoo::Api::Shopping.category_ranking" do

  let(:res_genre) {
    VCR.use_cassette('shopping_category_ranking_' + category_id.to_s+ '_'+ gender.to_s) do
      Yahoo::Api::Shopping.category_ranking({:category_id => category_id,:gender => gender})
    end
  }

  context 'found items by genre' do
    let(:category_id) { '13457' }
    let(:gender) { 'female' }
    it_should_behave_like 'found items by genre'
  end

  context 'not found items by genre' do
    let(:category_id) { '95' }
    let(:gender) { 'female' }
    it_should_behave_like 'not found items by genre'
  end

end

describe "Yahoo::Api::Shopping.item_search" do

  let(:res_genre) {
    VCR.use_cassette('shopping_item_search_' + category_id.to_s+ '_'+ exp_area.to_s) do
      Yahoo::Api::Shopping.item_search({:category_id => category_id,:exp_area => exp_area})
    end
  }

  let(:res_keyword) {
    VCR.use_cassette('shopping_item_search_' + query.to_s) do
      Yahoo::Api::Shopping.item_search({:query => query})
    end
  }

  let(:res_error) {
    VCR.use_cassette('shopping_item_search') do
      Yahoo::Api::Shopping.item_search({})
    end
  }

  context 'found items by genre' do
    let(:category_id) { '13457' }
    let(:exp_area) { '13' }
    it_should_behave_like 'found items by genre'
  end

  context 'not found items by genre' do
    let(:category_id) { '617' }
    let(:exp_area) { '01' }
    it_should_behave_like 'not found items by genre'
  end

  context 'found items by keyword' do
    let(:query) { 'au' }
    it_should_behave_like 'found items by keyword'
  end

  context 'not found items by keyword' do
    let(:query) { 'auaaaaaaa' }
    it_should_behave_like 'not found items by keyword'
  end

  context 'bad request' do
    it_should_behave_like 'bad request'
  end

end

