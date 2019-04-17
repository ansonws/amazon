require 'rails_helper'

RSpec.describe NewsArticle, type: :model do
    
    describe "validates" do
        it "requires a title" do
        article = NewsArticle.new()
        article.valid?
        messages = article.errors.messages
        expect(messages).to(have_key(:title))
        end

        it "requires a unique title, regardless of case" do
        article = NewsArticle.new(title: "Facebook")

        it "requires a description" do
        article = NewsArticle.new(
            title: "Facebook Stores Passwords as Text",
            view_count: 556
        )
        article.valid?
        messages = article.errors.messages
        expect(messages).to(have_key(:description))
        end
    end
end
