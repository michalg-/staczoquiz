# frozen_string_literal: true

class BaseService
  class << self
    def call(*args, **kwargs, &)
      new(*args, **kwargs).tap { _1.call(&) }
    end
    alias :'()' call
  end

  def call
    raise "Define `call` for #{self.class.name} first"
  end

  def result
    @result ||= {}
  end

  def success?
    errors.empty?
  end

  def errors
    @errors ||= []
  end
end
