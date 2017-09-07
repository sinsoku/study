require 'spec_helper'

describe Book do
  it 'can be initialized with attributes' do
    book = Book.new(title: 'Refactoring')
    book.title.must_equal 'Refactoring'
  end
end
