class PostPolicy < ApplicationPolicy
	def update?
    user.role.name == 'admin'
  end

  # def edit
  # 	update?
  # end

	def index?
    user.role.name == 'admin'
  end
  
  def create?
    user.role.name == 'admin'
  end

  def new?
    user.role.name == 'admin'
  end

  def destroy?
    user.role.name == 'admin'
  end

end
