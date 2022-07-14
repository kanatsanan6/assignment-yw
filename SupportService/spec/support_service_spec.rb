require 'support_service'

describe 'SupportService' do
  let(:ticket) { Ticket.new(id = '1', restrictions = ['English']) }
  let(:agent1) { Agent.new(name = 'A', skills = ['English'], load = 2) }
  let(:agent2) { Agent.new(name = 'B', skills = ['English', 'Japanese'], load = 0) }

  describe LeastLoadedAgent do
    let(:instance) { described_class.new }

    context 'example testcase' do
      it 'returns agent2' do
        expect(instance.find(ticket, [agent1, agent2])).to eq agent2
      end
    end
    
    context 'no agent found' do
      it 'raises NoAgentFoundException' do
        expect { instance.find(ticket, []) }.to raise_error 'NoAgentFoundException'
      end

      it 'raises NoAgentFoundException' do
        agent = Agent.new(name = 'C', skills = ['English'], load = 3)
        expect { instance.find(ticket, [agent]) }.to raise_error 'NoAgentFoundException'
      end
    end

    context 'least loaded agent with nonsorted skills' do
      it 'returns agent2' do
        agent3 = Agent.new(name = 'C', skills = ['Spanish', 'Japanese', 'English'], load = 0)
        expect(instance.find(ticket, [agent1, agent2, agent3])).to eq agent2
      end
    end
  end

  describe LeastFlexibleAgent do
    let(:instance) { described_class.new }

    context 'example testcase' do
      it 'returns agent1' do
        expect(instance.find(ticket, [agent1, agent2])).to eq agent1
      end
    end

    context 'no agent found' do
      it 'raises NoAgentFoundException' do
        expect { instance.find(ticket, []) }.to raise_error 'NoAgentFoundException'
      end

      it 'raises NoAgentFoundException' do
        agent = Agent.new(name = 'C', skills = ['English'], load = 3)
        expect { instance.find(ticket, [agent]) }.to raise_error 'NoAgentFoundException'
      end

      it 'raises NoAgentFoundException' do
        ticket2 = Ticket.new(id = '2', restrictions = ['Spanish'])
        expect { instance.find(ticket2, [agent1, agent2]) }.to raise_error 'NoAgentFoundException'
      end
    end

    context 'least flexible agent with less load' do
      it 'returns agent3' do
        agent3 = Agent.new(name = 'C', skills = ['English'], load = 0)
        expect(instance.find(ticket, [agent1, agent2, agent3])).to eq agent3
      end
    end

    context 'least flexible agent with more load' do
      it 'returns agent3' do
        agent3 = Agent.new(name = 'C', skills = ['English, Japanese'], load = 1)
        agent4 = Agent.new(name = 'D', skills = ['English'], load = 2)
        expect(instance.find(ticket, [agent3, agent4])).to eq agent4
      end
    end

    context 'least flexible agent with nonsorted load' do
      it 'returns agent3' do
        agent3 = Agent.new(name = 'C', skills = ['English'], load = 0)
        expect(instance.find(ticket, [agent1, agent2, agent3])).to eq agent3
      end
    end
  end
end