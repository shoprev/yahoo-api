# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

share_examples_for 'found items' do
  context 'code' do
    it { expect(res.code).to eq 200 }
  end
  context 'size' do
    it { expect(res["ResultSet"]["@attributes"]["totalResultsReturned"].to_i).to be > 0 }
  end
end

share_examples_for 'not found items' do
  context 'code' do
    it { expect(res.code).to eq 200 }
  end
  context 'size' do
    it { expect(res["ResultSet"]["@attributes"]["totalResultsReturned"].to_i).to eq 0 }
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

describe "Yahoo::Api::Auction.show_rating" do

  let(:res) {
    VCR.use_cassette('auction_show_rating_' + id.to_s) do
      Yahoo::Api::Auction.show_rating({:id => id})
    end
  }

  let(:res_error) {
    VCR.use_cassette('auction_show_rating') do
      Yahoo::Api::Auction.show_rating({})
    end
  }

  context 'found items' do
    let(:id) { 'kaz_vegi' }
    it_should_behave_like 'found items'
  end

  context 'bad request' do
    it_should_behave_like 'bad request'
  end

end

describe "Yahoo::Api::Auction.show_q_and_a" do

  let(:res) {
    VCR.use_cassette('auction_show_q_and_a_' + auctionID.to_s) do
      Yahoo::Api::Auction.show_q_and_a({:auctionID => auctionID})
    end
  }

  context 'found items' do
    let(:auctionID) { 'h180241200' }
    it_should_behave_like 'found items'
  end

  context 'not found items' do
    let(:auctionID) { 'x297261554' }
    it_should_behave_like 'not found items'
  end

end

describe "Yahoo::Api::Auction.bid_history_detail" do

  let(:res) {
    VCR.use_cassette('auction_bid_history_detail_' + auctionID.to_s) do
      Yahoo::Api::Auction.bid_history_detail({:auctionID => auctionID})
    end
  }

  context 'found items' do
    let(:auctionID) { 'x297261554' }
    it_should_behave_like 'found items'
  end

end

describe "Yahoo::Api::Auction.bid_history" do

  let(:res) {
    VCR.use_cassette('auction_bid_history_' + auctionID.to_s) do
      Yahoo::Api::Auction.bid_history({:auctionID => auctionID})
    end
  }

  context 'found items' do
    let(:auctionID) { 'x297261554' }
    it_should_behave_like 'found items'
  end

end

describe "Yahoo::Api::Auction.item" do

  let(:res) {
    VCR.use_cassette('auction_item_' + auctionID.to_s) do
      Yahoo::Api::Auction.item({:auctionID => auctionID})
    end
  }

  context 'found items' do
    let(:auctionID) { 'x297261554' }
    it_should_behave_like 'found items'
  end

end

describe "Yahoo::Api::Auction.search" do

  let(:res) {
    VCR.use_cassette('auction_search_' + query.to_s) do
      Yahoo::Api::Auction.search({:query => query})
    end
  }

  context 'found items' do
    let(:query) { 'au' }
    it_should_behave_like 'found items'
  end

  context 'not found items' do
    let(:query) { 'auaaaaaaaaaaaaaaa' }
    it_should_behave_like 'not found items'
  end

end

describe "Yahoo::Api::Auction.selling_list" do

  let(:res) {
    VCR.use_cassette('auction_selling_list_' + sellerID.to_s) do
      Yahoo::Api::Auction.selling_list({:sellerID => sellerID})
    end
  }

  context 'found items' do
    let(:sellerID) { 'ichienshop55' }
    it_should_behave_like 'found items'
  end

end

describe "Yahoo::Api::Auction.category_leaf" do

  let(:res) {
    VCR.use_cassette('auction_category_leaf_' + category.to_s) do
      Yahoo::Api::Auction.category_leaf({:category => category})
    end
  }

  context 'found items' do
    let(:category) { '23336' }
    it_should_behave_like 'found items'
  end

end

describe "Yahoo::Api::Auction.category_tree" do

  let(:res) {
    VCR.use_cassette('auction_category_tree_' + category.to_s) do
      Yahoo::Api::Auction.category_tree({:category => category})
    end
  }

  context 'found items' do
    let(:category) { '0' }
    it_should_behave_like 'found items'
  end

end
