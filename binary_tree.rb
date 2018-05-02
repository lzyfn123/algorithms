###################
#            A
#         /    \
#        B     C
#       / \   /
#      D  E  F
#     / \     \
#    G  H     I
#      / \
#     J  K
# 前序遍历：A-B-D-G-H-J-K-E-C-F-I
# 中序遍历：G-D-J-H-K-B-E-A-F-I-C
# 后序遍历：G-J-K-H-D-E-B-I-F-C-A
# 层序遍历：A-B-C-D-E-F-G-H-I-J-K

class TreeNode
  attr_accessor :data, :parent, :left, :right
  
  class << self
    # 前序录入
    def create_nodes(parent = nil, desc = '根', &block)
      printf "录入【#{parent && parent.data} - #{desc}】节点"
      val = block.call
      puts(" => #{val}")
      
      if val == 'exit'
        exit
      elsif val == 'null'
        nil
      else
        node        = TreeNode.new(val)
        node.parent = parent
        node.left   = create_nodes(node, '左', &block)
        node.right  = create_nodes(node, '右', &block)
        node
      end
    end
  end
  
  def initialize(data)
    self.data = data
  end
  
  def is_root?
    parent.nil?
  end
  
  def is_leaf?
    left.nil? && right.nil?
  end
  
  def desc
    "当前节点：#{data}，左边节点：#{left&.data || '-'}，右边节点：#{right&.data || '-'}"
  end
  
  # ============= 前序遍历 =============
  # A-B-D-G-H-J-K-E-C-F-I
  def desc_dlr(arr = [])
    arr << data
    left.desc_dlr(arr) if left
    right.desc_dlr(arr) if right
    arr
  end
  
  def desc_dlr_loop
    result = []
    stack  = [self]
    
    loop do
      break if stack.empty?
      
      node = stack.pop
      result.push(node.data)
      
      stack.push(node.right) if node.right
      stack.push(node.left) if node.left
    end
    
    result
  end
  
  # ============= 中序遍历 =============
  # G-D-J-H-K-B-E-A-F-I-C
  def desc_ldr(arr = [])
    left.desc_ldr(arr) if left
    arr << data
    right.desc_ldr(arr) if right
    
    arr
  end
  
  def desc_ldr_loop
    result = []
    stack  = []
    top    = self
    
    loop do
      break if stack.empty? && top.nil?
      
      if top
        stack << top
        top = top.left
      else
        top = stack.pop
        result.push(top.data)
        top = top.right
      end
    end
    
    result
  end
  
  # ============= 后序遍历 =============
  # G-J-K-H-D-E-B-I-F-C-A
  def desc_lrd(arr = [])
    left.desc_lrd(arr) if left
    right.desc_lrd(arr) if right
    arr << data
    
    arr
  end
  
  def desc_lrd_loop
    result = []
    stack  = [self]
    
    loop do
      break if stack.empty?
      
      node = stack.pop
      result.push(node.data)
      
      stack.push(node.left) if node.left
      stack.push(node.right) if node.right
    end
    
    result.reverse
  end
  
  # ============= 层序遍历 =============
  # A-B-C-D-E-F-G-H-I-J-K
  def desc_layer_loop
    result = []
    nodes  = [self]
    
    loop do
      break if nodes.empty?
      
      node = nodes.shift
      result.push(node.data)
      
      nodes.push(node.left) if node.left
      nodes.push(node.right) if node.right
    end
    
    result
  end
end

# ========= 录入 ============
tree_vals = %w[A B D G null null H J null null K null null E null null C F null I]

tree = TreeNode.create_nodes do
  val = tree_vals.shift
  val.nil? ? 'null' : val
end

puts tree.desc_dlr.join('-')
puts tree.desc_dlr_loop.join('-')

puts tree.desc_ldr.join('-')
puts tree.desc_ldr_loop.join('-')

puts tree.desc_lrd.join('-')
puts tree.desc_lrd_loop.join('-')

puts tree.desc_layer_loop.join('-')
