# no original gist

$local_var = "Global Var"
$global_var = "REAL Global Var... so aptly named."
THIS_IS_A_CONSTANT = "I'M SO CONSTANT"

def get_global_var
  p $global_var
end

def set_global_var= new_value 
  $global_var = new_value
end

def get_constant_var
  p THIS_IS_A_CONSTANT
end

# def set_constant_var= new_value
#   THIS_IS_A_CONSTANT = new_value
# end

def get_local_var
  p $local_var        #this is different than...
  local_var = "Local Var"
  p local_var         #...this.
end


class BasicClass 
  @@class_var = "Class Var"

  def initialize
    @instance_var = "Instance Var"
  end

  def get_local_var
    p $local_var       
    local_var = "Local Var Within Class"
    p local_var         
  end

  def get_instance_var
    p @instance_var
  end

  def set_instance_var= new_value
    @instance_var = new_value
  end

  def get_class_var 
    p @@class_var
  end

  def set_class_var= new_value
    @@class_var = new_value
  end

  def get_global_var
    p $global_var
  end

  def set_global_var= new_value 
    $global_var = new_value
  end

  def get_constant_var
    p THIS_IS_A_CONSTANT
  end

  # def set_constant_var= new_value
  #   THIS_IS_A_CONSTANT = new_value
  # end

end


### Driver Code ###

p get_local_var

silly = BasicClass.new
silly.get_local_var
silly.set_instance_var = "ridiculous!"
silly.get_instance_var

foo = BasicClass.new
foo.set_instance_var = 'hilarious!'
foo.get_instance_var
silly.get_instance_var

foo.get_class_var
silly.get_class_var
foo.set_class_var = "redonkulous!"
silly.get_class_var

get_constant_var
get_global_var

silly.get_constant_var
silly.get_global_var

# set_constant_var =  "this is beyond silly"
set_global_var = "this will always be silly"

silly.get_constant_var
silly.get_global_var

# silly.set_constant_var = "this is within the realm of silly"
silly.set_global_var = "this is plain silly"

silly.get_constant_var
silly.get_global_var



