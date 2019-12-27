class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    user.admin? or not record.published?
  end

  def create?
    user.admin? or not record.published?
  end

  def new?
    user.role.name == 'admin'
  end

  def update?
    user.role? :admin or not record.published?
  end

  # def edit?
  #   user.admin? or not record.published?
  # end

  def destroy?
    user.role.name == 'admin'
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
