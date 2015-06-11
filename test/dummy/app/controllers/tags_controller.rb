class TagsController < ApplicationController
  tokenize

  def index
    @tags = Tag.all
  end

  private

    def set_tag

    end

    def tag_params

    end
end
