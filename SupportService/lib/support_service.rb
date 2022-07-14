class Ticket
  attr_accessor :id, :restrictions

  def initialize(id, restrictions)
    @id = id
    @restrictions = restrictions
  end
end

class Agent
  attr_accessor :name, :skills, :load

  def initialize(name, skills, load)
    @name = name
    @skills = skills
    @load = load
  end

  def can_load?(ticket)
    return false if @load >= 3
    return false if ticket.restrictions.any? { |restriction| !@skills.include?(restriction) }

    true
  end

  def less_loaded?(another_agent)
    return true if @load < another_agent.load
    return @skills.length < another_agent.skills.length if @load == another_agent.load

    false
  end

  def less_flexible?(another_agent)
    return true if @skills.length < another_agent.skills.length
    return self.less_loaded?(another_agent) if @skills.length == another_agent.skills.length

    false
  end
end

class LeastLoadedAgent
  attr_accessor :ticket, :agents

  def find(ticket, agents)
    ans_index = -1
    agents.each_with_index do |agent, index|
      ans_index = index if agent.can_load?(ticket) and (ans_index == -1 or agent.less_loaded?(agents[ans_index]))
    end
    return agents[ans_index] if ans_index != -1

    raise 'NoAgentFoundException'
  end
end

class LeastFlexibleAgent
  attr_accessor :ticket, :agents

  def find(ticket, agents)
    ans_index = -1
    agents.each_with_index do |agent, index|
      puts index
      ans_index = index if agent.can_load?(ticket) and (ans_index == -1 or agent.less_flexible?(agents[ans_index]))
    end
    return agents[ans_index] if ans_index != -1

    raise 'NoAgentFoundException'
  end
end