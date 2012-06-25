require 'spec_helper'
describe MoviesController do
  describe 'find movies with similar director' do
    before :each do
      @fake_results = [mock('movie1'), mock('movie2')]
#fake_result = mock('movie',:id=> "1", :title => "Star Wars", :director => "George Lucas")
#@fake_result = FactoryGirl.build(:movie, :id => "1", :title => "Star Wars", :director => "George Lucas") 
    end
    it 'should route to the director route' do
      assert_routing('movies/1/director', {:controller => 'movies', :action => 'director', :id => '1'}) 
    end
    it 'should call the model method that performs search' do
      Movie.should_receive(:find_similar_movies).with('1').
        and_return(@fake_results)
      post :director , {:id => '1' }
    end
    it 'should select the display movies for the same director template' do
      Movie.stub(:find_similar_movies).and_return(@fake_results)
      post :director , {:id => '1' }
      response.should render_template('director')
    end
    it 'should make the search results available to that template'  do
      Movie.stub(:find_similar_movies).and_return(@fake_results)
      post :director , {:id => '1' }
      assigns(:movies).should == @fake_results
    end
  end
end
