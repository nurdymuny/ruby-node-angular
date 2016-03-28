class PushRedis

  class << self
    def node_message action
	    msg = { resource: 'User',
	          action: 'action',
	          id: 'id',
	          obj: 'obj' }

	     $redis.publish "node-rails-change/test_user_id", msg.to_json
     end
  end

end