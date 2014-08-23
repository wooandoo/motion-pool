describe 'Pool' do
  before do
    @delegate = NSObject.alloc.init
    
    @object1 = NSObject.alloc.init
    @object2 = NSObject.alloc.init
    @object3 = NSObject.alloc.init
    
    @pool = Pool.alloc.initWithDelegate(@delegate)
  end
  
  # --------------------------------------------------------------------------------
  
  it 'should borrow an object' do
    @delegate.stub!(:makeObject, return: @object1)
    object = @pool.borrow_object
    object.should.not == nil
  end
  
  # --------------------------------------------------------------------------------
  
  it 'should return an object' do
    @delegate.stub!(:makeObject, return: @object1)
    object = @pool.borrow_object
    
    should.not.raise(Exception) {
      @pool.return_object(object)
    }
  end
  
  # --------------------------------------------------------------------------------
  
  it 'should borrow a returned object' do
    @delegate.stub!(:makeObject, return: @object1)
    object = @pool.borrow_object
    
    @pool.return_object(object)

    @delegate.should_not_call(:makeObject)
    new_object = @pool.borrow_object
    
    new_object.should == object
  end
  
  # --------------------------------------------------------------------------------
  
  it 'should raise an exception if an unkown object is returned' do
    should.raise(Pool::Exception) do
      @pool.return_object(@object1)
    end
  end
  
  # --------------------------------------------------------------------------------
  # --------------------------------------------------------------------------------
  # --------------------------------------------------------------------------------
  
  describe 'idle objects' do
    it 'should return 0 idle object after the creation of the pool' do
      @pool.idle_object_count.should == 0
    end
  
    # --------------------------------------------------------------------------------
  
    it 'should increment the number of idle object after a borrow/return' do
      @delegate.stub!(:makeObject, return: @object1)
      object = @pool.borrow_object
      @pool.return_object(object)
    
      @pool.idle_object_count.should == 1
    end
    
    # --------------------------------------------------------------------------------
  
    it 'should decrement the number of idle object after a borrow/return/borrow' do
      @delegate.stub!(:makeObject, return: @object1)
      object = @pool.borrow_object
      @pool.return_object(object)
      object = @pool.borrow_object
    
      @pool.idle_object_count.should == 0
    end
  end
  
  # --------------------------------------------------------------------------------
  # --------------------------------------------------------------------------------
  # --------------------------------------------------------------------------------
  
  describe 'active objects' do
    it 'should return 0 active object after the creation of the pool' do
      @pool.active_object_count.should == 0
    end
  
    # --------------------------------------------------------------------------------
  
    it 'should increment the number of active objects after a borrow' do
      @delegate.stub!(:makeObject, return: @object1)
      object = @pool.borrow_object
    
      @pool.active_object_count.should == 1
    end
    
    # --------------------------------------------------------------------------------
  
    it 'should decrement the number of active objects after a return' do
      @delegate.stub!(:makeObject, return: @object1)
      object = @pool.borrow_object
      @pool.return_object(object)
    
      @pool.active_object_count.should == 0
    end
  end
end