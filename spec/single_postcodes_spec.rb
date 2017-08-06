require 'spec_helper'

describe Postcodesio do

	context 'checking test on a single postcode work correctly' do
		#tear up/set up
		before(:all) do
			@postcodes = Postcodesio.new
		end
		#plan tests
		it 'single postcode should not be empty' do
			expect(@postcodes.single_postcodes('en35qj')).not_to be_empty
		end

		it 'should be an instance of the class Postcodesio' do
			expect(@postcodes).to be_instance_of(Postcodesio)
		end

		it 'results key should be a Hash' do
			expect(@postcodes.single_postcodes('en35qj')["result"]).to be_kind_of(Hash)
		end

		it 'quality key should be an Integer and between 1 and 9' do
			expect(@postcodes.single_postcodes('en35qj')["result"]["quality"]).to be_kind_of(Integer)
			expect(@postcodes.single_postcodes('en35qj')["result"]["quality"]).to be_between(1,9)
		end

		it 'should have a key which is a string' do
			@postcodes.single_postcodes('en35qj').each do |k,v|
				expect(k.class).to eq(String)
			end
		end

		it 'should have a key equal to result' do
			expect(@postcodes.single_postcodes('en35qj')).to have_key("result")
		end

		it 'should have a value with a range of classes' do
			@postcodes.single_postcodes('en35qj')["result"].each do |k,v|
				expect(v.class).to eq(Integer).or eq(Float).or eq(String).or eq(NilClass).or be(Hash)
			end
		end

		it 'should have a status key equal to 200' do
			expect(@postcodes.single_postcodes('en35qj')["status"]).to eq(200)
		end

		it 'should have a key equal to postcode' do
			expect(@postcodes.single_postcodes('en35qj')["result"].keys[0]).to eq("postcode")
		end

		it 'should be a kind of hash' do
			expect(@postcodes.multiple_postcodes(["en35qj","se96rj"])).to be_kind_of(Hash)
		end

		it 'should have keys which are strings or integers' do
			@postcodes.multiple_postcodes(["en35qj","se96rj"]).each do |k,v|
				expect(k).to be_kind_of(String)
			end
		end
	end

end