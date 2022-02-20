class PolyTreeNode

    attr_accessor :value, :parent, :children
  
    def initialize(value)
      @value = value
      @parent = nil
      @children = []  
  
    end
  
    def inspect
      @value
    end
    
    def parent=(value)
      self.parent.children.delete(self) unless self.parent == nil
      @parent = value
      unless @parent == nil
        value.children << self      
      end
    end
  
    def add_child(child)   
      child.parent = self
    end
  
    def remove_child(child)
      child.parent = nil
      raise "not a child" unless child.parent.children.include?(child)
    end
  
    def dfs(target)
      return self if self.value == target    
      self.children.each do |child|
       
         result = child.dfs(target)
         return result unless result.nil?
      end    
      nil
    end
  
    def bfs(target)
      queue = []
      queue << self
      until queue.empty?      
        p queue
        check = queue.shift
        return check if check.value == target
        queue += check.children
      end
      nil
    end
  
  end