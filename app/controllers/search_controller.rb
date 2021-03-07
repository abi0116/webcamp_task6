class SearchController < ApplicationController
  def search
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @model = params["search"]["model"]
    @datas = search_for(@how,@model,@content)
  end

  private

    def perfect_match(model,content)
      if model == "user"
        User.where(name: content)
      elsif model == "book"
        Book.where(title: content)
      end
    end

    def forward_match(model,content)
      if model == "user"
        User.where("name Like ?","#{content}%")
      elsif model == "book"
        Book.where("title Like ?","#{content}%")
      end
    end

    def backward_match(model,content)
      if model == "user"
        User.where("name Like ?","%#{content}")
      elsif model == "book"
        Book.where("title Like ?","%#{content}")
      end
    end

    def partical_match(model,content)
      if model == "user"
        User.where("name Like ?","%#{content}%")
      elsif model == "book"
        Book.where("title Like ?","%#{content}%")
      end
    end

    def search_for(how,model,content)
      case how
      when "perfect_match"
        perfect_match(model,content)
      when "forward_match"
        forward_match(model,content)
      when "backward_match"
        backward_match(model,content)
      when "partical_match"
        partical_match(model,content)
      end
    end
end
