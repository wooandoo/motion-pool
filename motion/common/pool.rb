class Pool
  class Exception < NSException
  end
  
  # --------------------------------------------------------------------------------
  # --------------------------------------------------------------------------------
  # --------------------------------------------------------------------------------
  
  class PooledObject
    attr_accessor :object
    
    # --------------------------------------------------------------------------------
    
    def initWithObject(object)
      @object = object
      
      self
    end
  end
    
  # --------------------------------------------------------------------------------
  # --------------------------------------------------------------------------------
  # --------------------------------------------------------------------------------
  
  def initWithDelegate(delegate)
    @delegate = delegate
    @idle_objects = []
    @active_objects = {}
    
    self
  end
  
  # --------------------------------------------------------------------------------
  
  def borrow_object
    pooled_object = @idle_objects.shift
    
    if pooled_object.nil?
      object = @delegate.makeObject
      pooled_object = Pool::PooledObject.alloc.initWithObject(object)
    else
      object = pooled_object.object
    end
    
    @active_objects[object] = pooled_object
    
    object
  end
  
  # --------------------------------------------------------------------------------
  
  def return_object(object)
    pooled_object = @active_objects[object]
    
    if pooled_object.nil?
      exception = Pool::Exception.alloc.initWithName("Pool::Exception", reason: "unkown object", userInfo: nil)
      exception.raise
    else
      @active_objects.delete(object)
      @idle_objects << pooled_object
    end
    
    nil
  end
  
  # --------------------------------------------------------------------------------
  
  def idle_object_count
    @idle_objects.count
  end
  
  # --------------------------------------------------------------------------------
  
  def active_object_count
    @active_objects.count
  end
end