require 'json'

run Proc.new {|env|
        msg = JSON.parse env["rack.input"].read
        puts  msg.to_json
 
        # recommend same article
        id =  msg["item"] ? msg["item"]["id"] : 0
        
        response = {:items=> [{:id=>id}],"version"=>1}.to_json
        puts response
        
        [200, {"Content-Type" => "text/json"},response]
}
