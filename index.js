const { Kafka } = require('kafkajs');

const kafka = new Kafka({
  clientId: 'my-app',
  brokers: ['uncommon-turtle-7322-us1-kafka.upstash.io:9092'],
  ssl: true,
  sasl: {
    mechanism: 'scram-sha-256',
    username: 'dW5jb21tb24tdHVydGxlLTczMjIkH4YXhQ7TAVnBqfmPKZCiJ7ymKHfRaQZIYQ4',
    password: 'MWM3MGQ5YjktMTI0NS00NTM2LWI5MzUtODk2ZTBmMDQ2ZDY1',
  },
});

const producer = kafka.producer();
const consumer = kafka.consumer({ groupId: 'test-group' });

const run = async () => {
  // Producing
  await producer.connect();
  await producer.send({
    topic: 'test-topic',
    messages: [
      {
        value: {
          name: 'abdulrahmaan',
          age: 26,
        },
      },
      {
        value: {
          name: 'mohammed',
          age: 16,
        },
      },
    ],
  });
  console.log('Message sent successfully');
  await producer.disconnect();

  // Consuming
  await consumer.connect();
  await consumer.subscribe({ topic: 'test-topic', fromBeginning: true });

  await consumer.run({
    eachMessage: async ({ topic, partition, message }) => {
      console.log({
        partition,
        offset: message.offset,
        value: message.value.toString(),
      });
    },
  });
};

run().catch(console.error);
