class LinkedList

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value, nil)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value, nil)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
    @size += 1
  end

  def pop
    return if @head.nil?
    if @head.next_node.nil?
      @head = nil
      @tail = nil
    else
      @tail = at(@size - 2)
      @tail.next_node = nil
    end
    @size -= 1
  end

  def contains?(value)
    return if @head.nil?
    target_node = @head
    i = 0
    while i < @size
      return true if target_node.value == value
      target_node = target_node.next_node
      i += 1
    end
    return false
  end

  def find(value)
    return if @head.nil?
    target_node = @head
    i = 0
    while i < @size
      return i if target_node.value == value
      target_node = target_node.next_node
      i += 1
    end
    return nil
  end

  def at(index)
    return if @head.nil? || index < 0 || index >= @size
    target_node = @head
    i = 0
    while i < index
      target_node = target_node.next_node
      i += 1
    end
    target_node
  end

  def insert_at(value,index)
    return if index < 0 || index > @size
    if index == 0
      prepend(value)
    elsif index == @size
      append(value)
    else
      new_node = Node.new(value, nil)
      header_node = at(index - 1)
      trailer_node = at(index)
      header_node.next_node = new_node
      new_node.next_node = trailer_node
      @size += 1
    end
    return
  end

  def remove_at(index)
    return if index < 0 || index >= @size
    if index == (@size - 1)
      pop
    elsif index == 0
      @head = at(1)
      @size -= 1
    else
      header_node = at(index - 1)
      header_node.next_node = at(index + 1)
      @size -= 1
    end
    return
  end

  def to_s
    return if @head.nil?
    value_list = []
    target_node = @head
    i = 0
    while i < @size
      value_list << target_node.value
      target_node = target_node.next_node
      i += 1
    end
    value_list.join(' -> ').gsub(/\d/,'( \0 )')
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    @tail
  end


end