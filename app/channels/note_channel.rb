class NoteChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'note'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    Note.find(data["id"]).update!(text: data["text"])
    ActionCable.server.broadcast('note', data)
  end
end
