# Реалізувати ієрархію з 3 об'єктів. Реалізувати методи пошуку та отримання списку відсортованих об'єктів

# 1.Бібліотека публікацій. Визначити ієрархію наукових публікацій. Підібрати список публікацій з бібліотеки, на які посилається обрана публікація. Забезпечити пошук публікацій за бібліографічними даними і за ключовими словами. Надати вибірку публікацій з сортуванням за релевантністю пошуковому запиту.

class Library
    def initialize()
        @all_articles = []
    end

    def add_article(name, author, year, pages, keywords, references_names, type)        
        references = []
        for reference in references_names do
            references << find_article_by_name(reference)
        end
        case type
        when "Physics"
            @all_articles << PhysicsScientificArticle.new(name, author, year, pages, keywords, references)
        when "Math"
            @all_articles << MathScientificArticle.new(name, author, year, pages, keywords, references)
        when "Political"
            @all_articles << PoliticalPublicisticArticle.new(name, author, year, pages, keywords, references)
        when "Economic"
            @all_articles << EconomicPublicisticArticle.new(name, author, year, pages, keywords, references)
        when "Social"
            @all_articles << SocialAddvertismentArticle.new(name, author, year, pages, keywords, references)
        when "Commercial"
            @all_articles << CommercialAddvertismentArticle.new(name, author, year, pages, keywords, references)
        end
    end

    def find_article_by_name(name)
        result =  @all_articles.select {|article| article.name == name}
        result.sort_by {|article| article.name}
        return result
    end

    def find_article_by_author(author)
        result =  @all_articles.select {|article| article.author == author}
        result.sort_by {|article| article.author}
        return result
    end

    def find_article_by_keywords(keywords)
        result = []
        for article in @all_articles do
            for key in keywords do
                for word in article.keywords do
                    if word == key
                        result << article
                        break
                    end
                end
            end
        end
        result.sort_by {|article| article.name}
        return result
    end
    
    def print_all_articles
        for article in @all_articles do
            article.print_article
        end
    end
    
    def print_articles(articles)
        for article in articles do
            article.print_article
        end
    end

end

class Article
    attr_accessor :name, :author, :year, :pages, :keywords, :references, :type

    def initialize(name, author, year, pages, keywords, references)        
        @name = name
        @author = author
        @year = year
        @pages = pages
        @keywords = keywords
        @references = references
        @type = nil
    end 

    def print_references
        puts "References for #{@name}:"
        for reference in @references do
            puts reference.name
        end
    end

    def print_article
        puts "Article: #{@name}, #{@author}, #{@year}, #{@pages}, #{@keywords}, #{type}"
    end
end

class ScientificArticle  < Article
    def initialize(name, author, year, pages, keywords, references)
        super(name, author, year, pages, keywords, references)
    end
end

class PhysicsScientificArticle < ScientificArticle
    def initialize(name, author, year, pages, keywords, references)
        super(name, author, year, pages, keywords, references)
        @type = "Physics"
    end
end

class MathScientificArticle < ScientificArticle
    def initialize(name, author, year, pages, keywords, references)
        super(name, author, year, pages, keywords, references)
        @type = "Math"
    end
end

class PublicisticArticle < Article
    def initialize(name, author, year, pages, keywords, references)
        super(name, author, year, pages, keywords, references)
    end
end

class PoliticalPublicisticArticle < PublicisticArticle
    def initialize(name, author, year, pages, keywords, references)
        super(name, author, year, pages, keywords, references)
        @type = "Political"
    end
end

class EconomicPublicisticArticle < PublicisticArticle
    def initialize(name, author, year, pages, keywords, references)
        super(name, author, year, pages, keywords, references)
        @type = "Economic"
    end
end

class AddvertismentArticle < Article
    def initialize(name, author, year, pages, keywords, references)
        super(name, author, year, pages, keywords, references)
    end
end

class SocialAddvertismentArticle < AddvertismentArticle
    def initialize(name, author, year, pages, keywords, references)
        super(name, author, year, pages, keywords, references)
        @type = "Social"
    end
end

class CommercialAddvertismentArticle < AddvertismentArticle
    def initialize(name, author, year, pages, keywords, references)
        super(name, author, year, pages, keywords, references)
        @type = "Commercial"
    end
end

library = Library.new()
library.add_article("Publication1", "Author1", 2010, 10, ["keyword1", "keyword5"], ["Article2", "Article4"], "Physics")
library.add_article("Publication2", "Author2", 2011, 11, ["keyword1", "keyword7"], ["Article1", "Article4"], "Math")
library.add_article("Publication3", "Author3", 2012, 12, ["keyword2", "keyword3"], ["Article4", "Article5"], "Political")
library.add_article("Publication4", "Author1", 2013, 13, ["keyword4", "keyword6"], ["Article2"], "Economic")
library.add_article("Publication5", "Author5", 2014, 14, ["keyword2", "keyword5"], ["Article3"], "Social")
library.add_article("Publication6", "Author6", 2015, 15, ["keyword6", "keyword4"], ["Article1"], "Commercial")
library.print_all_articles()
puts " "
library.print_articles(library.find_article_by_name("Publication3"))
puts " "    
library.print_articles(library.find_article_by_author("Author1"))
puts " "
library.print_articles(library.find_article_by_keywords(["keyword1", "keyword2"]))
